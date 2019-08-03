class LikesController < ApplicationController
  before_action :set_opinion, :set_clip

  def create
    @like = Like.create(user_id: current_user.id, opinion_id: @opinion.id, clip_id: @clip.id)
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