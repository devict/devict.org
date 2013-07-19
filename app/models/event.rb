class Event < ActiveRecord::Base
  attr_accessible :date, :description, :photo_url, :title, :url, :venue_address, :venue_city, :venue_name, :venue_state, :venue_zip
end
