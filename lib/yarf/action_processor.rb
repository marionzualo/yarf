require "json"

module Yarf
  ActionResult = ImmutableStruct.new(:success?, :content, :error)
  class ActionProcessor
    def initialize(action)
      @action = action
    end

    def process(params)
      params_hash = HashWithIndifferentAccess.new(params)
      action_content = action.call(params_hash)

      if action_content
        ActionResult.new(success: true, content: action_content.to_json)
      else
        ActionResult.new(success: true, content: "")
      end
    end

    private

    attr_reader :action
  end
end
