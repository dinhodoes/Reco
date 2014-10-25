class SessionsController < ApplicationController

	def new
		# Present an empty login form
		@user = User.new
		@is_login = true
	end

	def create	
		u = User.where(email: params[:user][:email]).first
		if u && u.authenticate(params[:user][:password_digest])
			# Store as a cookie in the users' browser the ID of them,
			# indicating that they are logged in
			session[:user_id] = u.id.to_s
			redirect_to new_rekognize_path, :notice => "Logged in!"
		elsif u == nil
			flash[:error] = "Invalid Email"
			render 'new'
		elsif u && !u.authenticate(params[:user][:password])
			flash[:error] = "Invalid Password"
			render 'new' 
		end
	end

	def destroy
		reset_session
		redirect_to root_path, :notice => "Logged out!"
		# if the above doesn't work...
		# session[:user_id] = nil
		# render 'new'
	end

end
