class User < ActiveRecord::Base
  has_many :services

  attr_accessible :email, :name
end
