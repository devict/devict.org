class Post < ActiveRecord::Base
  attr_accessible :guid, :published_at, :summary, :title, :url

  def self.update_posts
    feed = Feedzirra::Feed.fetch_and_parse("pipes.yahoo.com/pipes/pipe.run?_id=135445826f5a0387e81f341b1f194a51&_render=rss")

    feed.entries.each do |entry|
      unless Post.exists? :guid => entry.entry_id
        Post.create!(
          :title        => entry.title,
          :summary      => entry.summary,
          :url          => entry.url,
          :published_at => entry.published,
          :guid         => entry.entry_id
        )
      end
    end
  end
end
