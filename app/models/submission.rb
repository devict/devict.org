class Submission < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :user

  attr_accessible :challenge_id, :code

  validates :code, :presence => true
end
