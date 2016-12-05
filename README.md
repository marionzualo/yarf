# Yarf

Small web framework for JSON APIs based on [Rack](https://rack.github.io/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yarf'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yarf

## Usage

Given the following files are in a certain directory:
```ruby
# config.ru
require "yarf"

get "/foo" do
  { results: [1, 2, 3] }
end

# `params` contains a deserialized version of the JSON object passed in the request body. The Hash keys are accessible as
# symbols.
post "/bar" do |params|
  name = params[:name]

  { name: name }
end

run Yarf::WebApp
```

```ruby
# Gemfile
# frozen_string_literal: true
source "https://rubygems.org"

gem "yarf"
```

Run the server with `bundle exec rackup --port 3000`.

Play around with the server's endpoints:

The files for this example can be obtained [here](https://github.com/marionzualo/yarf_example_app).

```
› curl http://localhost:3000/foo
{"results":[1,2,3]}%

› curl -XPOST http://localhost:3000/bar -i -H "Content-Type: application/json" -d '{"name": "Mario"}'
HTTP/1.1 200 OK
Content-Type: application/json
Transfer-Encoding: chunked
Server: WEBrick/1.3.1 (Ruby/2.3.0/2015-12-25)
Date: Mon, 05 Dec 2016 05:41:08 GMT
Connection: Keep-Alive

{"name":"Mario"}%
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/marionzualo/yarf.

## License
MIT (c) Mário Nzualo
