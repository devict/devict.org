class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    event.update_attributes!(params[:event])
    flash[:notice] = 'Event updated successfully.'
    redirect_to root_url
  end
end
