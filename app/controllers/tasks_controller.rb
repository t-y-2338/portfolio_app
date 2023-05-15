class TasksController < ApplicationController
  before_action :set_post
  before_action :set_task, only: %i[update completed incomplete destroy]

  def create
    @task = @post.tasks.create(task_params)
    redirect_to post_path(@post)
  end

  def update
    if @task.update(task_params)
      redirect_to post_path(@post)
    else
      render post_path(@post)
    end
  end

  def completed
    @task.update(completed: true)
    redirect_to post_path(@post)
  end

  def incomplete
    @task.update(completed: false)
    redirect_to post_path(@post)
  end

  def destroy
    @task.destroy
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:body, :completed)
  end
end
