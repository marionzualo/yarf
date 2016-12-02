require "yarf/version"
require "yarf/web_app"

Rack::Handler::WEBrick.run Yarf::WebApp
