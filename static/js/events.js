$(function(){
    $.ajax({
        url : 'https://devict-patreon.herokuapp.com/events',
        type: 'GET',
        success : function(data) {
			var htmlString = "";
			$.each(data.results, function (i, item) {
	    		htmlString += '<div class="panel panel-default"> \
	    							<div class="panel-heading">  \
	    								<h3 class="panel-title"> \
	    									<a href="' + item.event_url + '" target="_blank" style="text-transform:uppercase">' + item.name + '</a> \
										</h3> \
									</div> \
									<div class="panel-body"> \
										<p>' + item.description + '</p> \
										<b>Venue:</b> ' + item.venue.name + ', ' + item.venue.address_1 + ', ' + item.venue.city + '&nbsp;  \
										<a href="https://www.google.com/maps/@' + item.venue.lat + ',' + item.venue.lon + ',18z" target="_blank"> <i class="fa fa-map-marker" aria-hidden="true"></i> Map It!</a> \
										<p><b>Date and Time</b>: ' + epochConv(item.time) + '</p> \
										<p><a href=' + item.event_url + ' data-event=' + item.id + ' class="mu-rsvp-btn">RSVP</a> &nbsp; \
										<a class="btn btn-sm btn-default" href="' + item.event_url + '" target="_blank" role="button"><i class="fa fa-external-link" aria-hidden="true"></i> Go to Meetup</a><br></p> \
									</div> \
								</div>';
			});
			$('#events').html(htmlString);
    	}
    })  
})

function epochConv(t) {
	var myDate = new Date(t);
  	return myDate.toLocaleString();
}