require "sinatra"
require "sinatra/activerecord"
require_relative './models/user'
require_relative './models/favorite'
require_relative './models/post'
require_relative './models/posttag'
require_relative './models/tag'


set :database, {adapter: 'postgresql', database: 'polyglot'}
enable :sessions


#Homepage when not logged in  ITOWRRRRKKKKSSSS DONT TOUCH
get '/' do 
	erb :index	
end

get '/index' do 
	erb :index	
end

#Logged in state homepage  ITOWRRRRKKKKSSSS DONT TOUCH

get '/home' do 	
	@user = User.find(session[:id])
	if @user != nil
		session[:id]= @user.id
	erb :home,:layout => :layout_loggedin
	else
		redirect :'/signup'
	end
end

# signup route for signup form  ITOWRRRRKKKKSSSS DONT TOUCH
get '/signup' do
	erb :signup
end

#signup ITOWRRRRKKKKSSSS DONT TOUCH
post '/signup' do
	@user = User.create(first_name: params[:firstname], last_name: params[:lastname], email: params[:email], username: params[:username], password: params[:password], birthday: params[:birthday])
	session[:id]= @user.id
	erb :profile, :layout => :layout_loggedin
end

#Logged in profile   ITOWRRRRKKKKSSSS DONT TOUCH
get '/profile' do 
	@user = User.find(session[:id])
	if @user != nil
		session[:id]= @user.id
	erb :profile, :layout => :layout_loggedin
	else 
		redirect :'/signup'
	end
end

# Login get and Login post BOTH WORKKKKKKKK DONT TOUCH!!!
get '/login' do
	erb :login
end

post '/login' do
	@user = User.find_by(username: params[:username],password: params[:password])
	if @user != nil
		session[:id]= @user.id
		erb :home, :layout => :layout_loggedin
	else 
		redirect :'/signup'
	end
end

#New post route
get '/new' do 
	@user = User.find(session[:id])
	if @user != nil
		session[:id]= @user.id
	erb :new, :layout => :layout_loggedin
	else
		redirect :'/signup'
	end
end

 post '/new' do 
 	@post = Post.create(title:params[:title],body:params[:body],date: params[:date],user_id: session[:id])
 	redirect :'/profile'
 end
