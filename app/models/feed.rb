class Feed < ActiveRecord::Base
  attr_accessible :url, :user, :approved
  
  belongs_to :user
  has_many :post
end
