describe Yarf::ResponseBuilder do
  describe "#build" do
    context "when the action result is successful" do
      it "returns a 200 repponse" do
        result = Yarf::ActionResult.new(success: true, content: "Hello world.")

        response = described_class.new.build(result)

        expected_response = [200, {"Content-Type" => "application/json"}, ["Hello world."]]
        expect(response).to eq(expected_response)
      end
    end
    context "when the action result is not successful" do
      it "returns a 500 response" do
        result = Yarf::ActionResult.new(success: false)

        response = described_class.new.build(result)

        expected_response = [500, {"Content-Type" => "application/json"}, [""]]
        expect(response).to eq(expected_response)
      end
    end
  end
  describe "#not_found" do
    it "returns a 404 response" do
      response = described_class.new.not_found

      expected_response = [404, {"Content-Type" => "application/json"}, [""]]
      expect(response).to eq(expected_response)
    end
  end
end
