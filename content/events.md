+++
date = "2016-07-18T14:52:11-05:00"
title = "Events"
scripts = [
  "/js/events.js",
]
+++
<!-- Meetup official Image asset -->
<!-- http://www.meetup.com/help/customer/portal/articles/1802998-promotional-materials-for-your-meetup-group/ -->
# <img src="https://a248.e.akamai.net/secure.meetupstatic.com/photos/event/8/f/1/d/highres_454596637.jpeg" width="75" height="75"> Upcoming Events

<div id="loading" class="text-center">
  <i class="fa fa-cog fa-spin fa-5x"></i>
</div>

<!-- placeholder html that will be filled with data from events.js -->
<div id="events" class="hidden">
  <div class="panel panel-default"> 
      <div class="panel-heading">
        <h3 class="panel-title">
          <a href="" class="event_url" target="_blank" style="text-transform:uppercase">
            <span class="event_name"></span>
          </a> 
      </h3>
    </div>
    <div class="panel-body">
      <p>
        <span class="event_description"></span>
      </p>
      <b>Venue:</b>
      <span class="event_venue_name"></span>, 
      <span class="event_venue_address"></span>, <span class="event_venue_city"></span>&nbsp;
      <a href="" class="event_map" target="_blank"> <i class="fa fa-map-marker" aria-hidden="true"></i> Map It!</a> 
      <p>
        <b>Date and Time</b>: 
        <span class="event_time"></span>
      </p> 
      <a class="btn btn-sm btn-primary event_url" href="" target="_blank" role="button">
        <i class="fa fa-external-link" aria-hidden="true"></i> 
        Visit Meetup
      </a>
      <br>
    </div>
  </div>
</div>

<!-- displays meetup results -->
<div id="results" class="hidden"></div>
