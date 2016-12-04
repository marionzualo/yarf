module Yarf
  class WebApp
    def self.call(env)
      req = Rack::Request.new env
      route = web_app_router.find(method: req.request_method, path: req.path)
      params = Yarf::RequestParamsProcessor.new(req).process

      if route
        action_result = Yarf::ActionProcessor.new(route.action).process(params)
        response_builder.build(action_result)
      else
        response_builder.not_found
      end
    end

    def self.web_app_router
      @@web_app_router ||= Yarf::WebAppRouter
    end

    def self.response_builder
      Yarf::ResponseBuilder.new
    end
  end
end
