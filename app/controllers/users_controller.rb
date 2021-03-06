class UsersController < ApplicationController
	def index
		@users = User.all
	end
	
	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_url, :notice => "Signed up!"
		else
			render "new"
		end
	end

	private
		def user_params
			params.require(:user).permit(:email, :password_hash,
				:password_salt, :password, :password_confirmation)
		end
end
