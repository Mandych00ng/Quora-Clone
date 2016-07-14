# http_path = "/"
# css_dir = "css"
# sass_dir = "scss"
# images_dir = "images"
# javascripts_dir = "js"
# fonts_dir = "fonts"

# output_style = :expanded

# color_output = false
get '/signup' do
	erb :'static/sign_up'
end

post '/signup' do
	@user = User.new(params[:user])
	if @user.save
		@msg = "Hey Mate! welcome!"
		@user = User.all
		erb :"static/index"

		# redirect to '/user/dashboard'
	else
		@msg = "Try try again"
		@user = User.all
		erb :"static/index"
	end
end

# get '/user/dashboard' do
# 	erb :dashboard
# end
post '/login' do
	@user = User.find_by(email: params[:user][:email])
	if @user 
		if @user.authenticate(params[:user][:password])
			log_in(@user)
			redirect '/home'
		else
			@msg = "Wrong email or password"
		end
	end
end

get '/logout' do
	log_out
	redirect '/'
end
