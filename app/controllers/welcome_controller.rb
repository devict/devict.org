class WelcomeController < ApplicationController
  def index
    @irc_users = IrcUser.all()
  end
end
