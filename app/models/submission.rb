class Submission < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :user

  attr_accessible :challenge_id, :code, :language

  validates :code, :presence => true

  has_many :comments
end
