class CommentsController < ApplicationController
  def create
    @clip = Clip.find(params[:clip_id])
    @opinion = Opinion.find(params[:opinion_id])
    # @comment = @post.comments.create(params[:comment])
    @comment = @opinion.comments.create(comment_params)
    redirect_to clip_opinion_path(@clip, @opinion)
  end

  def destroy
    @clip = Clip.find(params[:clip_id])
    @opinion = Opinion.find(params[:opinion_id])
    @comment = @opinion.comments.find(params[:id])
    @comment.destroy
    redirect_to clip_opinion_path(@clip ,@opinion)
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :commenter)
  end
end
