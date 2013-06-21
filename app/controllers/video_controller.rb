class VideoController < ApplicationController
  before_filter :populate

  def index
    @videos = Video.order("created_at DESC, title").page(params[:page]).per(6)
  end

  private
  def isStale?
    return true if 0 == Video.count

    video = Video.order("updated_at DESC").first
    return true if (Time.new - video.updated_at) > (7 * 24 * 60 * 60)

    return false
  end

  def populate
    if isStale?
      Video.destroy_all

      videos = Feedzirra::Feed.fetch_and_parse("https://gdata.youtube.com/feeds/api/playlists/PLLV_XLUgRXpyeqm5l_q0a4wx0ngt2fziR")

      videos.entries.each do |entry|
        Video.create({
          :title => entry.title,
          :content => entry.content,
          :published_at => entry.published,
          :link => entry.image
        })
      end
    end
  end
end
