class PostsController < ApplicationController

  before_action :fetch_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.limit(5)
    @post = @posts.max_by{|p| p.created_at}
    @posts = @posts - [@post]
  end

  def show
    @posts = Post.limit(4).where("id != ?", params[:id].to_i)
    @post = Post.find(params[:id].to_i)
    render 'index'
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :new
    end
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :author_id)
  end

  def fetch_post
    @post = Post.find(params[:id].to_i)
  end

end
