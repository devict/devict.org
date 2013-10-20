class User < ActiveRecord::Base
  include Gravtastic

  has_many :services
  has_many :challenges
  has_many :submissions

  attr_accessible :email, :name, :info

  gravtastic size: 200
end
