require "spec_helper"

describe Room do
  describe "room" do
    before :each do
      @room = Room.new
    end

    it "should initialize meeting variables to empty" do
      expect(@room.morning_session_meetings).to be_empty
      expect(@room.afternoon_session_meetings).to be_empty
      expect(@room.meetings).to be_empty
    end
  end
end