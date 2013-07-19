class Video < ActiveRecord::Base
  attr_accessible :content, :link, :title, :published_at
end
