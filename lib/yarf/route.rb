module Yarf
  class Route

    attr_reader :path, :method, :action

    def initialize(path:, method:, action:)
      @path = path
      @method = method
      @action = action
    end

    def ==(other)
      path == other.path && method == other.method
    end
    alias_method :eql?, :==

    def hash
      path.hash + method.hash
    end

    def self.not_found
      action = ->(env) { [404, {"Content-Type"  => "application/json"}, [""]] }
      new(path: "/not_found", method: :get, action: action)
    end
  end
end
