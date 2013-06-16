class User < ActiveRecord::Base
  has_many :services
  has_many :challenges
  has_many :submissions

  attr_accessible :email, :name
end
