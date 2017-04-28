require "spec_helper"

describe Meeting do
  describe "meeting" do
    before :each do
      @data = ["Meeting-1", "60min"]
      @meeting = Meeting.new(@data[0], @data[1])
    end
    it { expect(@meeting).to respond_to(:name) }
    it { expect(@meeting).to respond_to(:duration) }

    it "should initialize variables correctly" do
      expect(@meeting.name).to eq @data[0]
      expect(@meeting.duration).to eq @data[1][/\d+/].to_i
      expect(@meeting.scheduled).to eq false
    end
  end
end