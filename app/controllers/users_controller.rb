class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    user = User.find_by(id: session[:user_id])
    user = session[:user_id] if user.nil?
    p Redis.current.smembers("user:#{user}:bookmarks")
    @bookmarks = Bookmark.where(id: Redis.current.smembers("user:#{user}:bookmarks"))
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
