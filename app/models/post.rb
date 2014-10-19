class Post < ActiveRecord::Base
  attr_accessible :guid, :published_at, :summary, :title, :url, :feed

  belongs_to :feed

  def self.update_posts
    @feeds = Feed.where(:approved => true)

    @feeds.each do |feed|
      puts feed.url

      begin
          feed_handle = Feedzirra::Feed.fetch_and_parse(feed.url)

          feed_handle.entries.each do |entry|
            unless Post.exists? :guid => entry.entry_id
              Post.create!(
                           :title        => entry.title,
                           :summary      => entry.summary,
                           :url          => entry.url,
                           :published_at => entry.published,
                           :guid         => entry.entry_id,
                           :feed         => feed
                           )
            end
          end
      rescue
          # Continue
      end
    end
  end
end
