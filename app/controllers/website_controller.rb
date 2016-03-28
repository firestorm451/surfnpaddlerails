class WebsiteController < ApplicationController

  def index
    @posts = Post.all
    @post = @posts.max_by{|p| p.created_at}
    @posts = @posts - [@post]
  end

  def show
    @posts = Post.all.reject{|post| post.id == params[:id].to_i}
    @post = Post.find(params[:id].to_i)
    render 'index'
  end
end
