describe Yarf::ActionProcessor do
  describe "#process" do
    context "when the action returns an object" do
      it "returns the JSON form of the response" do
        params = { :name => "world" }
        action = ->(p) { { :foo => "hello #{p[:name]}" } }

        result = described_class.new(action).process(params)

        expect(result).to be_success
        expect(result.content).to eq({ :foo => "hello world" }.to_json)
      end
    end
    context "when the action returns nothing" do
      it "returns an empty string" do
        params = { :name => "world" }
        action = ->(p) { }

        result = described_class.new(action).process(params)

        expect(result).to be_success
        expect(result.content).to eq("")
      end
    end
  end
end
