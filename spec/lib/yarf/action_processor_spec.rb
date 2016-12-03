describe Yarf::ActionProcessor do
  describe "#process" do
    context "when the action executes successfully" do
      it "returns the JSON form of the response" do
        params = { :name => "world" }
        action = ->(p) { { :foo => "hello #{p[:name]}" } }

        result = described_class.new(action).process(params)

        expect(result).to be_success
        expect(result.content).to eq({ :foo => "hello world" }.to_json)
      end
    end
    context "when the action raises an error" do
      it "returns a failure response" do
        params = { :name => "world" }
        action = ->(p) { raise "error" }

        result = described_class.new(action).process(params)

        expect(result).to_not be_success
      end
    end
  end
end
