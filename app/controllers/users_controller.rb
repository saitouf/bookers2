class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @users = User.find(params[:id])  
    @user = @users
    @book = Book.new
    @books = @users.books
  end

  def edit
    @user = User.find(params[:id]) 
    redirect_to(user_path) unless @user == current_user
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)  
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
