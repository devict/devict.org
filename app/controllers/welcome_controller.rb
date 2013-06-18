class WelcomeController < ApplicationController
  def index
    @irc_users = IrcUser.order('handle')
  end
end
