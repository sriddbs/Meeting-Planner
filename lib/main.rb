require_relative "meeting_planner"

class Main
  file = ARGV[0]
  if file.nil?
    puts "Error: No input file specified"
  else
    planner = MeetingPlanner.new file
    planner.schedule
    if planner.contents.empty?
      puts "Error: No input content supplied"
    else
      planner.output_meetings
    end
  end
end