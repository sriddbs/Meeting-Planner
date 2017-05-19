require_relative "meeting_planner"
require_relative "parser"

class Main
  file = ARGV[0]
  if file.nil?
    puts "Error: No input file specified"
  else
    p = Parser.new(file)
    meetings = p.read_file

    if meetings.empty?
      puts "No meetings to schedule"
    else
      planner = MeetingPlanner.new(meetings)
      planner.schedule
      planner.output_meetings
    end
  end
end