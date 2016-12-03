module Yarf
  class WebApp
    def self.call(env)
      req = Rack::Request.new env.dup
      route = router.find(method: req.request_method, path: req.path)

      if route
        action_result = Yarf::ActionProcessor.new(route.action).process(req.params)
        response_builder.build(action_result)
      else
        response_builder.not_found
      end
    end

    def self.router
      @@router ||= begin
        r = Yarf::Router.new
        action = ->(params) { "Hello #{params["name"]}" }
        home_route = Yarf::Route.new(path: "/", method: "GET", action: action)
        r.register(home_route)
        r
      end
    end

    def self.response_builder
      Yarf::ResponseBuilder.new
    end
  end
end
