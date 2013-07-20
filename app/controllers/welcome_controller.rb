class WelcomeController < ApplicationController
  def index
    @irc_users = IrcUser.order('handle')
    @events = Event.order('date DESC').all(limit: 5)
    @featured_event = @events.slice!(0)
  end
end
