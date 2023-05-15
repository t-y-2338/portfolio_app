class PostsController < ApplicationController
  before_action :require_login
  before_action :set_user, only: %i[edit update done destroy]

  def index
    @today = Time.zone.today
    @posts = Post.where(user: current_user, done_on: nil).order(created_at: :desc)
    @posts_done = Post.where(user: current_user).where.not(done_on: nil)
  end

  def show
    @post = Post.find(params[:id])
    @task = Task.new
    @tasks = @post.tasks
    @memo = Memo.new
    @memos = @post.memos
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def edit
    redirect_to post_path(@post.id) if @post.done_on.present?
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def done
    @today = Time.zone.today
    @post.update(done_on: @today)
    redirect_to posts_path
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
