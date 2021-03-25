class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json:{ comment: comment }
    else
      @support = Support.find(params[:support_id])
      render 'supports/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :show
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, support_id: params[:support_id])
  end
end
