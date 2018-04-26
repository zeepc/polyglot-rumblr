require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader"
# require_relative './models/attt'


set :database, {adapter: 'postgresql', database: 'polyglot'}


#Homepage when not logged in 
get '/' do 
	erb :index	
end

#Logged in state homepage

get '/logged' do 
	erb :logged
end

#signup or log-in
post '/signup' do
	erb :signup
end

#Logged in profile 
get '/profile' do 
	erb :profile
end

#New post route
get '/new' do 
	erb :new
end