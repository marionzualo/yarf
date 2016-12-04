describe Yarf::RequestParamsProcessor do
  describe "#process" do
    context "when the request has a JSON content type" do
      context "when there is a JSON object enclosed in the body" do
        it "returns a HashWithIndifferentAccess representation of the body enclosed JSON object" do
          json_object = { :foo => "bar" }
          body = double("body", read: json_object.to_json)
          request = double("request", body: body, content_type: "application/json")

          params = described_class.new(request).process

          expect(params).to eq(HashWithIndifferentAccess.new(json_object))
        end
      end
      context "when there isn't a JSON object enclosed in the body" do
        it "returns an empty hash" do
          body = double("body", read: "")
          request = double("request", body: body, content_type: "application/json")

          params = described_class.new(request).process

          expect(params).to eq({})
        end
      end
    end
    context "when the request does not have a JSON content type" do
      it "returns an empty hash" do
        request = double("request", content_type: "text/plain")

        params = described_class.new(request).process

        expect(params).to eq({})
      end
    end
  end
end
