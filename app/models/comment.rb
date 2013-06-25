class Comment < ActiveRecord::Base
  belongs_to :submission
  belongs_to :user
  attr_accessible :body
end
