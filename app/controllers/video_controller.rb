class VideoController < ApplicationController
  def index
    @videos = Video.order("created_at DESC, title").page(params[:page]).per(6)
  end
end
