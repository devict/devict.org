class IrcUser < ActiveRecord::Base
  attr_accessible :handle

  def to_param
    handle
  end
end
