class PostsController < ApplicationController
  def index
    @posts = Post.order("published_at DESC").page(params[:page]).per(6)
  end
end
