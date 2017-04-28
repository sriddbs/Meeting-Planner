require "spec_helper"

describe MeetingPlanner do
  describe "planner" do
    before :each do
      p = Parser.new("./spec/test.txt")
      @meetings = p.read_file
      @planner = MeetingPlanner.new(@meetings)
    end

      it "initializes empty rooms" do
        expect(@planner.rooms[0].meetings).to be_empty
        expect(@planner.rooms[1].meetings).to be_empty
      end

      it "can schedule the meetings between 2 rooms" do
        @planner.schedule
        expect(@planner.rooms[0].morning_session_meetings.size).to eq 4
        expect(@planner.rooms[0].afternoon_session_meetings.size).to eq 7
        expect(@planner.rooms[1].morning_session_meetings.size).to eq 6
        expect(@planner.rooms[1].afternoon_session_meetings.size).to eq 3
      end
  end
end