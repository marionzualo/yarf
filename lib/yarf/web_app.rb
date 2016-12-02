module Yarf
  class WebApp
    def self.call(env)
      req = Rack::Request.new env.dup
      route = router.find(method: req.request_method, path: req.path)
      route.action.call(env)
    end

    def self.router
      @@router ||= begin
        r = Yarf::Router.new
        action = ->(env) { [200, {"Content-Type"  => "application/json"}, [""]] }
        home_route = Yarf::Route.new(path: "/", method: "GET", action: action)
        r.register(home_route)
        r
      end
    end
  end
end
