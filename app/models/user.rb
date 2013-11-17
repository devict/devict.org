class User < ActiveRecord::Base
  include Gravtastic

  has_many :services
  has_many :challenges
  has_many :submissions
  has_many :feeds

  attr_accessible :email, :name, :info, :feeds, :color

  gravtastic size: 200
end
