class CommentsController < ApplicationController
  def create
    @comment = Comment.new(strip_comment_params)
    @comment.save
    flash[:notice] = "Comment has successfully been added."
    redirect_to phase_path(strip_comment_params[:phase_id])

    # respond_to do |format|
    #   format.js
    # end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @phase_id = @comment.phase.id
    @comment.destroy
    flash[:notice] = "Comment has successfully been deleted."
    redirect_to phase_path(@phase_id)
  end

  private

  def strip_comment_params
    params.require(:comment).permit(:comment_body, :phase_id, :user_id)
  end
end
