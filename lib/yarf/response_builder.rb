module Yarf
  class ResponseBuilder
    def build(action_result)
      [200, {"Content-Type" => "application/json"}, [action_result.content]]
    end

    def not_found
      [404, {"Content-Type"  => "application/json"}, [""]]
    end
  end
end
