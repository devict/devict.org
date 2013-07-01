class Comment < ActiveRecord::Base
  belongs_to :submission
  belongs_to :user

  # is this a good idea with :submission_id? i don't think it allows anything "new" in terms of mischief.
  attr_accessible :body, :submission_id

  validates :body, :presence => true
  validates :submission, :presence => true
  validates :user, :presence => true
end
