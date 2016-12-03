require "json"

module Yarf
  ActionResult = ImmutableStruct.new(:success?, :content, :error)
  class ActionProcessor
    def initialize(action)
      @action = action
    end

    def process(params)
      action_content = action.call(params)
      if action_content
        ActionResult.new(success: true, content: action_content.to_json)
      end
    rescue StandardError => e
      ActionResult.new(success: false, error: e)
    end

    private

    attr_reader :action
  end
end
