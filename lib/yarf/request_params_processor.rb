module Yarf
  class RequestParamsProcessor
    def initialize(req)
      @req = req
    end

    def process
      if req.content_type == "application/json"
        body_content = req.body.read
        json_object = JSON.parse(body_content)
        HashWithIndifferentAccess.new(json_object)
      else
        {}
      end

    rescue JSON::ParserError
      {}
    end

    private

    attr_reader :req
  end
end
