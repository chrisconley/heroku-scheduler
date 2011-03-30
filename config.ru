require 'resque/server'
require 'resque_scheduler'
require './config_resque.rb'

use Rack::Auth::Basic do |username, password|
  [username, password] == ['admin', 'password']
end

run Rack::URLMap.new \
  "/" => lambda { |env|
    [404, {'Content-Type' => 'text/html'}, ["<html><head><title>Dammit !</title></head><body>There's nothing to see here !</body></html>"]]
   },
  "/resque" => Resque::Server.new
