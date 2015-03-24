class WelcomeController < ApplicationController
  def index
    @events = Event.where(upcoming: false).order('date DESC').limit(4)
    @featured_event = Event.where(upcoming: true).order('date ASC').first
  end

  def conduct; end

  def binary; end

  def about; end

  def request_invite; end

  def game_jam; end
end
