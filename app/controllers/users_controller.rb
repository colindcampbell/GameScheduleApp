class UsersController < ApplicationController
	def new
    @user = User.new
 	end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "#{@user.name} you have signed up successfully"
      session[:remember_token] = @user
      redirect_to :root
    else
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
