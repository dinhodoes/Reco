class UsersController < ApplicationController

	def index
		@user = User.all
	end

	def new
		@user = User.new
	end

	def create
    	@user = User.new(params.require(:user).permit(:username, :email, :password))
    		if @user.save
      			session[:user_id] = @user.id.to_s
      			redirect_to new_rekognize_path,:notice => "Signed up!"
    		else
      			render 'new'
    		end
	end

	def show
	end

	def destroy
		User.find(params[:id]).destroy
			#session[:user_id] == nil
    	redirect_to root_path
	end

end
