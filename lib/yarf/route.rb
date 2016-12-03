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
  end
end
