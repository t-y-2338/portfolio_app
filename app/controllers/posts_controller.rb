class PostsController < ApplicationController
  before_action :require_login
  before_action :set_user, only: %i[edit update destroy]

  def index
    @posts = Post.where(user: current_user).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_show_path(post.id)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to posts_show_path(post.id)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_user
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :due_date)
  end
end
