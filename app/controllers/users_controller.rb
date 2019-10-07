class UsersController < ApplicationController
	def show
      @user = User.find(params[:id])
    end
    def edit
      @user = User.find(params[:id])
    end

	def update
	   @user = User.find(params[:id])
	   @user.update(user_params)
	   redirect_to user_path(@user.id)
	end
	private
  def user_params
    params.require(:industry).permit(:last_name,:first_name,:nickname,:phone_number,:email,:password,:password_confirmation)
  end
end

