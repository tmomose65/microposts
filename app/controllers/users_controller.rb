class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc).page(params[:page])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcom to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'Your Profile Updated'
    else
      render :edit
    end
  end
  
  def updat
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :place, :message)
  end
  
  def correct_user
    user = User.find(params[:id])
      if (current_user != user)
        redirect_to root_path, alert: 'Do not permit this page'
      end
  end
  
end
