require_relative "meeting"

class Room
  attr_accessor :meetings, :morning_session_meetings, :afternoon_session_meetings

  def initialize
    @morning_session_meetings = []
    @afternoon_session_meetings = []
    @meetings = @morning_session_meetings + @afternoon_session_meetings
  end
end