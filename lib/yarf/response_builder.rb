module Yarf
  class ResponseBuilder
    def build(action_result)
      if action_result.success?
        [200, {"Content-Type" => "application/json"}, [action_result.content]]
      else
        [500, {"Content-Type" => "application/json"}, [""]]
      end
    end

    def not_found
      [404, {"Content-Type"  => "application/json"}, [""]]
    end
  end
end
