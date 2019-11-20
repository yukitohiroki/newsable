class UserClipsController < ApplicationController
  before_action :set_user_clip, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /user_clips
  # GET /user_clips.json
  def index
    @user_clips = current_user.user_clips.order(created_at: :desc)
  end

  # GET /user_clips/1
  # GET /user_clips/1.json
  def show
    @clip = @user_clip.clip
    @like = current_user.likes.find_or_initialize_by(user_clip: @user_clip)
  end

  # GET /user_clips/new
  def new
    @user_clip = UserClip.new
  end

  # GET /user_clips/1/edit
  def edit
  end

  # POST /user_clips
  # POST /user_clips.json
  def create
    @clip = Clip.find_or_initialize_by(url: params[:url])
    @user_clip = current_user.user_clips.build(clip: @clip)
    respond_to do |format|
      if @clip.save && @user_clip.save
        format.html { redirect_to user_clips_url, notice: t('user_clips_thanks')  }
      end
    end
  end

  # PATCH/PUT /user_clips/1
  # PATCH/PUT /user_clips/1.json
  def update
    respond_to do |format|
      if @user_clip.update(user_clip_params)
        format.html { redirect_to @user_clip, notice: 'User clip was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_clip }
      else
        format.html { render :edit }
        format.json { render json: @user_clip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_clips/1
  # DELETE /user_clips/1.json
  def destroy
    @user_clip.destroy
    respond_to do |format|
      format.html { redirect_to user_clips_url, notice: 'User clip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_clip
      @user_clip = UserClip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_clip_params
      params.require(:user_clip).permit(:user_id, :clip_id)
    end
end 
