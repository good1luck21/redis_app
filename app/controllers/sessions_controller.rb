class SessionsController < ApplicationController
  def logout
    Redis.current.del("user:#{session[:user_id]}:bookmarks")
    session[:user_id] = nil
    redirect_to root_path
  end
end
