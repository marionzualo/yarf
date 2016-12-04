module Yarf
  class Router
    attr_reader :routes_list

    def initialize
      @routes_list = []
    end

    def register(route)
      routes_list << route
    end

    def find(path:, method:)
      routes_list.detect { |r| r.path == path && r.method == method }
    end
  end

  WebAppRouter = Yarf::Router.new
end

def get(path, &block)
  route = Yarf::Route.new(method: "GET", path: path, action: block)
  Yarf::WebAppRouter.register(route)
end

def post(path, &block)
  route = Yarf::Route.new(method: "POST", path: path, action: block)
  Yarf::WebAppRouter.register(route)
end
