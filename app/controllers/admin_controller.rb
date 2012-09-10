class AdminController < ApplicationController
  def index
    @posts = Post.order('created_at DESC')
    @users = User.order('created_at DESC')
  end
end
