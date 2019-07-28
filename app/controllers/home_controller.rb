class HomeController < ApplicationController
  def index
	 @clips = Clip.all
  end
end
