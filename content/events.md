+++
date = "2016-07-18T14:52:11-05:00"
title = "Events"
scripts = [
  "/js/events.js",
]
+++

## Recurring Events

#### We have several recurring events so there's always something to do. Be sure to <a href="http://www.meetup.com/devict/" class="underline">join us on Meetup</a> to stay informed!

<div class="row">
<div class="col-sm-3">
  <h3>Dev Talks</h3>
  <p>Monthly, every last Thursday.</p>
  <p>This event features a presentation on various development related topics. This is an opportunity to share knowledge and get exposure to all kinds of new technologies, languages, tools, and more.</p>
</div>

<div class="col-sm-3">
  <h3>Study Hall</h3>
  <p>Weekly, every Monday.</p>
  <p>Study Hall is your opportunity to learn how to code and improve your skills.</p>
</div>

<div class="col-sm-3">
  <h3>Code & Coffee</h3>
  <p>Thursday mornings at 7:00am.</p>
  <p>Start your day off right with this informal get together. Bring your laptop, enjoy some coffee, and hang out with other developers. Come whenever, leave whenever. Oh, and sometimes there are donuts.</p>
</div>

<div class="col-sm-3">
  <h3>Hangout</h3>
  <p>Monthly, every second Tuesday.</p>
  <p>The Hangout is a social event and an opportunity to hang out, talk code (or not) and enjoy some company. Sometimes we make things. Sometimes we have a beer or two. Always a good time.</p>
</div>
</div>

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
