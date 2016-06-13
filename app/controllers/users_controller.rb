class UsersController < ApplicationController
	def show
		@user = User.find_by(id: params[:id])
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find_by(id: params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to @user
		else
			render 'new'
		end
	end

	def update
		@user = User.find_by(id: params[:id])
		if @user.update(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find_by(id: params[:id])
		@user.destroy
		redirect_to users_path
	end

private

def user_params
  params.require(:user).permit(:name, :username, :email, :password)
end

end
