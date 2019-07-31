class OpinionsController < ApplicationController

  def show
    @clip = Clip.find(params[:clip_id])
    @opinion = Opinion.find(params[:id])
  end

  def new
    @clip = Clip.find(params[:clip_id])
    # @comment = @post.comments.create(params[:comment])
    @opinion = Opinion.new
  end

  def create
    @clip = Clip.find(params[:clip_id])
    # @comment = @post.comments.create(params[:comment])
    @opinion = @clip.opinions.create(opinion_params)
    redirect_to clip_path(@clip)
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def opinion_params
  params.require(:opinion).permit(:title, :body, :clip_id).merge(user_id: current_user.id)
  end
end