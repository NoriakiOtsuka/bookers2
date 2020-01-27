class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    #@user = User.new
    @user = current_user #絶対いる
    #@books = Book.all #いる？
    @book = Book.new #いる？
  end
  def show
    @user = User.find(params[:id]) #いる？
    @books = @user.books
    @book = Book.new #いる？
  end
  def edit
  	@user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render action: :edit
    end
  end

  private
  def user_params
  	params.require(:user).permit(:profile_image, :name, :introduction)
  end
end
