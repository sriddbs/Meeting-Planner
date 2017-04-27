require_relative "room"

class MeetingPlanner
  attr_accessor :rooms, :meetings

  MORNING_SESSION_MINUTES = 180
  AFTERNOON_SESSION_MINUTES = 240
  MORNING_SESSION_STARTS_AT = Time.parse("9:00 AM")
  AFTERNOON_SESSION_STARTS_AT = Time.parse("1:00 PM")

  def initialize meetings
    @meetings = meetings
    @rooms = [Room.new, Room.new]
  end

  def schedule
    @rooms.each_with_index do |r, i|
      morning_session_time = afternoon_session_time = nil
      available_meetings = @meetings.reject { |m| m.scheduled }

      available_meetings.each_with_index do |m, i|
        if r.morning_session_meetings.map(&:duration).inject(:+).to_i + m.duration <= MORNING_SESSION_MINUTES
          r.morning_session_meetings << m
          m.start_time = morning_session_time || MORNING_SESSION_STARTS_AT
          m.scheduled = true
          morning_session_time = m.start_time + (m.duration * 60)
        elsif r.afternoon_session_meetings.map(&:duration).inject(:+).to_i + m.duration <= AFTERNOON_SESSION_MINUTES
          r.afternoon_session_meetings << m
          m.start_time = afternoon_session_time || AFTERNOON_SESSION_STARTS_AT
          m.scheduled = true
          afternoon_session_time = m.start_time + (m.duration * 60)
        else
          break
        end
      end
    end
  end

  def output_meetings
    @rooms.each_with_index do |r, i|
      puts "Room #{i + 1}"
      r.morning_session_meetings.map(&:pretty_print)
      puts "12:00 PM Lunch"
      puts r.afternoon_session_meetings.map(&:pretty_print)
    end
  end
end