$(function(){
	var results = $("#results");
	results.empty();
    $.ajax({
        url : 'https://devict-patreon.herokuapp.com/events',
        type: 'GET',
        success : function(data) {
			$.each(data.results, function (i, item) {
	    		var t = $("#events div").clone();
	    		t.find(".event_url").attr("href", item.event_url);
	    		t.find(".event_name").text(item.name);
	    		t.find(".event_description").html(item.description);
		        t.find(".event_venue_name").text(item.venue.name);
		        t.find(".event_venue_address").text(item.venue.address_1);
				t.find(".event_venue_city").text(item.venue.city);
				t.find(".event_map").attr("href", 'https://www.google.com/maps/@' + item.venue.lat + ',' + item.venue.lon + ',18z');
				t.find(".event_time").text(epochConv(item.time));
				results.append(t[0]);
			});

			$("#loading").addClass("hidden");
    		$("#results").removeClass("hidden");
    	}
    })  
})

function epochConv(t) {
	var myDate = new Date(t);
  	return myDate.toLocaleString();
}
