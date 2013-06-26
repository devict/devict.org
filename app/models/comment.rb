class Comment < ActiveRecord::Base
  belongs_to :submission
  belongs_to :user

  # is this a good idea with :submission_id? it is for creates, but perhaps mischief with edits.
  attr_accessible :body, :submission_id

  validates :body, :presence => true
  validates :submission, :presence => true
  validates :user, :presence => true
end
