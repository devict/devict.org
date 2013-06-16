class Challenge < ActiveRecord::Base
  belongs_to :user
  has_many :submissions

  attr_accessible :description, :title

  validates_uniqueness_of :title
  validates :title, :presence => true
  validates :description, :presence => true
end
