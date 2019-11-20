class LikesController < ApplicationController
  before_action :set_opinion, :set_clip

  def create
    @opinion = Opinion.find params[:opinion_id]
    @like = @opinion.likes.build(user: current_user)
    respond_to do |format|
      if @like.save
        format.html { redirect_to opinion_path(@like.opinion),
         notice: 'いいねを押しました' }
        format.js
      end
    end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, opinion_id: @opinion.id, clip_id: @clip.id)
    @like.destroy
  end

  private
  def set_clip
    @clip = Clip.find(params[:clip_id])
  end

  def set_opinion
    @opinion = Opinion.find(params[:opinion_id])
  end
end