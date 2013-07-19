class IrcUser < ActiveRecord::Base
  attr_accessible :handle
  validates :handle, :presence => true

  def to_param
    handle
  end
end
