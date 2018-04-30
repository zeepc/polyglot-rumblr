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
	erb :home,:layout => :layout_loggedin
end

# signup route for signup form  ITOWRRRRKKKKSSSS DONT TOUCH
get '/signup' do
	erb :signup
end


#signup ITOWRRRRKKKKSSSS DONT TOUCH
post '/signup' do
	@user = User.create(first_name: params[:firstname], last_name: params[:lastname], email: params[:email], username: params[:username], password: params[:password], birthday: params[:birthday])
	session[:id]= @user.id
	erb :home, :layout => :layout_loggedin
end

#Logged in profile   ITOWRRRRKKKKSSSS DONT TOUCH
get '/admin' do 
	@user = User.find(session[:id])
	erb :admin, :layout => :layout_loggedin
end

# get '/admin/:id' do 
# 	@user = User.find(session[:id])
# 	erb :admin, :layout => :layout_loggedin
# end

# Login get and Login post BOTH WORKKKKKKKK DONT TOUCH!!!
get '/login' do
	erb :login
end

post '/login' do
	@user = User.find_by(username: params[:username],password: params[:password])
	if @user != nil
		session[:id]= @user.id
		@post = Post.where(user_id: session[:id])
		redirect '/home'
		# erb :home, :layout => :layout_loggedin
	else 
		redirect :'/signup'
	end
end

# Logout
get '/logout' do
	session.clear
	redirect :'/login'
end

#New get and post route
get '/new' do 
	erb :new, :layout => :layout_loggedin
end

 post '/new' do 
 	@post = Post.create(title:params[:title],body:params[:body],date: params[:date],user_id: session[:id])
 	redirect :'/admin'	
 end


 get '/myblog' do
 	@post = Post.where(user_id: session[:id])
 	erb :myblog, :layout => :layout_loggedin
 end

 get '/home' do
 	@user = User.find(session[:id])
 	@post = Post.where(user_id: session[:id])
 	erb :home, :layout => :layout_loggedin 
 end


# Show all users in "Social" page

get '/social' do
	@users = User.all
	erb :social, :layout => :layout_loggedin 
end


# Setup other user's profile and blog one page
get '/profile' do
	@specific_profile = User.find(params[:id])
	erb :profile, :layout => :layout_loggedin
end

get '/profile/:id' do
	@specific_profile = User.find(params[:id])
	@post = Post.where(user_id: @specific_profile.id)
	erb :profile, :layout => :layout_loggedin
end


# Render form for editing a new post (U)
get 'myblog/:id/edit' do 
    @specific_post = Post.find(params[:id])
    erb :edit, :layout => :layout_loggedin
end


#Edit post from /id/edit route (U)
# put 'myblog/:id' do
#     @specific_post = Post.find(params[:id])
#     @specific_post.update(title:params[:title],body:params[:body],date: params[:date],user_id: session[:id])
#     redirect :'/myblog'
# end
  
# Delete Attendee (D)
delete '/admin' do
	@current_user = session[:id]
    User.destroy(@current_user)
    session.clear
    redirect :'/signup'
end


