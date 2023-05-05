class MemosController < ApplicationController
  before_action :set_post
  before_action :set_memo, only: %i[edit update destroy]

  def create
    @memo = @post.memos.create(memo_params)
    redirect_to post_path(@memo.post)
  end

  def edit; end

  def update
    if @memo.update(memo_params)
      redirect_to post_path(@memo.post)
    else
      render post_path(@post.id)
    end
  end

  def destroy
    @memo.destroy
    redirect_to post_path(@memo.post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_memo
    @memo = Memo.find(params[:id])
  end

  def memo_params
    params.require(:memo).permit(:body).merge(user_id: current_user.id)
  end
end
