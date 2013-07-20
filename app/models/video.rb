class Video < ActiveRecord::Base
  attr_accessible :guid, :content, :link, :title, :published_at

  def self.update_videos
    feed = Feedzirra::Feed.fetch_and_parse("https://gdata.youtube.com/feeds/api/playlists/PLLV_XLUgRXpyeqm5l_q0a4wx0ngt2fziR")

    feed.entries.each do |entry|
      unless Video.exists? :guid => entry.id
        Video.create({
          :title        => entry.title,
          :content      => entry.content,
          :published_at => entry.published,
          :link         => entry.image,
          :guid         => entry.id
        })
      end
    end
  end
end
