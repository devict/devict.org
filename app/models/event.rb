class Event < ActiveRecord::Base
  attr_accessible :date, :description, :photo_url, :title, :url, :venue_address, :venue_city, :venue_name, :venue_state, :venue_zip

  def self.update_events
    RMeetup2::Client.api_key = "7c4d734c35c43246e1c3086d2c754d"

    @remote_events = RMeetup2::Request.new(:events, {
      group_urlname: 'upfrontwichita',
      status: 'upcoming,past'
    }).execute()

    @remote_events.each do |event|
      local_event = Event.first( conditions: [ 'title = ?', event['name'] ])
      params = {
        title: event['name'],
        description: event['description'],
        venue_name: event['venue']['name'],
        venue_address: event['venue']['address_1'],
        venue_city: event['venue']['city'],
        venue_state: event['venue']['state'],
        venue_zip: event['venue']['zip'],
        date: event['time'],
        url: event['event_url'],
        photo_url: 'hackathon.jpg'
      }

      if local_event == nil
        # event has not been saved locally
        Event.create(params)
      else
        params.delete(:photo_url)
        local_event.update_attributes(params)
        local_event.save
      end
    end
  end
end
