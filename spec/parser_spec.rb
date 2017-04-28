require "spec_helper"

describe Parser do
  describe "parser" do
    before :each do
      @parser = Parser.new("./spec/test.txt")
    end
    context "read file" do
      it "should return array of meeting objects" do
        meetings = @parser.read_file
        expect(meetings).to be_an_instance_of(Array)
      end

      it "should parse the right amount of data" do
        contents = IO.readlines(File.open(@parser.file_path))
        expect(contents.size).to eq(@parser.read_file.size)
      end
    end
  end
end