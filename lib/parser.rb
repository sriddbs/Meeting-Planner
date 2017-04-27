require_relative "meeting"

class Parser
  attr_accessor :file_path, :meetings

  def initialize(file_path)
    @file_path = file_path
    @meetings = []
  end

  def read_file
    contents = IO.readlines(File.open(@file_path))
    contents.each do |line|
      last_pos = line.chomp.rindex(/\s/)
      meeting_name = line[0..last_pos].strip
      meeting_duration = line[(last_pos + 1)..line.length].strip
      @meetings << Meeting.new(meeting_name, meeting_duration)
    end
    @meetings
  end
end