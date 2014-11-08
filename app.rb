require 'rubygems'
require 'sinatra'
require 'redis'


configure do
  redis_conf = { :host => 'localhost', :port => 6379, :password => 'pipa' }
  @@redis = Redis.new redis_conf
end

post '/:customer_id/users' do
  
end

post '/:customer_id/products' do
  
end

