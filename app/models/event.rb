class Event < ActiveRecord::Base
  attr_accessible :date,
    :description,
    :photo_url,
    :title,
    :url,
    :venue_address,
    :venue_city,
    :venue_name,
    :venue_state,
    :venue_zip,
    :upcoming

  scope :upcoming, where(upcoming: true)
  scope :past, where(upcoming: false)

  def self.update_events
    Event.destroy_all

    RMeetup2::Client.api_key = "7c4d734c35c43246e1c3086d2c754d"

    @remote_events = RMeetup2::Request.new(:events, {
      group_urlname: 'devict',
      status: 'upcoming'
    }).execute()

    @remote_events.sort! { |a, b| b['time'] <=> a['time'] }

    @remote_events.each do |event|
      local_event = Event.where(title: event['name']).first

      params = {
        title: event['name'],
        description: ApplicationHelper.first_p(event['description']),
        venue_name: event['venue']['name'],
        venue_address: event['venue']['address_1'],
        venue_city: event['venue']['city'],
        venue_state: event['venue']['state'],
        venue_zip: event['venue']['zip'],
        date: event['time'],
        url: event['event_url'],
        photo_url: 'hackathon.jpg',
        upcoming: event['time']/1000 >= Time.now.to_i ? true : false
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
