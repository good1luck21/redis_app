require 'securerandom'

class BookmarksController < ApplicationController
  def index
    if session[:user_id] == nil
      session[:user_id] = SecureRandom.hex(10)
    end
    @bookmarks = Bookmark.all
  end

  def add_bookmark
    Redis.current.sadd("user:#{session[:user_id]}:bookmarks", params[:id])
    redirect_to root_path
  end

  def delete_bookmark
    Redis.current.srem("user:#{session[:user_id]}:bookmarks", params[:id])
    redirect_to root_path
  end
end
