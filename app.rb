require 'rubygems'
require 'sinatra'
require 'redis'
require 'json'

configure do
  redis_conf = { 
    :host => 'localhost',
    :port => 6379,
    :db =>1
  }
  @@redis = Redis.new redis_conf
end

post '/customer_id/:customer_id/user_id/:user_id' do  
  content_type :json

  hash_postfix = params[:user_id][0..3]
  hash = "users:#{params[:customer_id]}:#{hash_postfix}"
  @@redis.hset( hash, 
                params[:user_id], 
                { "user" => params[:user_id].to_s )

  { "id" => params[:user_id], "status" => "ok"}.to_json
end

post '/customer_id/:customer_id/product_id/:product_id/name/:name/price/:price' do
  content_type :json

  hash_postfix = params[:product_id][0..3]
  hash = "products:#{hash_postfix}"
  
  @@redis.hset( hash, 
                params[:product_id], 
                { "name" => params[:name], "price" => params[:price] }.to_s )

  { "id" => params[:product_id], "status" => "ok" }.to_json
end

