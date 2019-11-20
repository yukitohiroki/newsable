class OpinionsController < ApplicationController

  def show
    @clip = Clip.find(params[:clip_id])
    @opinions = @clip.opinions
    @opinion = Opinion.find(params[:id])
    @like = current_user.likes.find_or_initialize_by(opinion: @opinion)
  end

  def new
    @clip = Clip.find(params[:clip_id])
    # @comment = @post.comments.create(params[:comment])
    @opinion = Opinion.new
  end

  def create
    @clip = Clip.find(params[:clip_id])
    @opinion_params = opinion_params.merge(clip: @clip)
    @opinion = current_user.opinions.build(@opinion_params)
    @opinion.clip = @clip
    respond_to do |format|
      if @opinion.save
              # 以下の部分を変更
        format.html { redirect_to @clip, notice: t('opinion_thanks') }
      else
        render 'clips/show'
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def opinion_params
    params.require(:opinion).permit(:name, :title, :body, :clip_id).merge(user_id: current_user.id)
  end
end