class WelcomeController < ApplicationController
  def index
    @irc_users = IrcUser.order('handle')
    @events = Event.where(upcoming: false).order('date DESC').limit(4)
    @featured_event = Event.where(upcoming: true).order('date ASC').first
  end
end
