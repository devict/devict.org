$(function(){

    function MentorData(data) {
        var self = this;

        self.mentors = ko.observableArray();
        $.each(data, function(i, item) {
            // only add to the list if the mentor has a username
            if (item.username != undefined) {
                self.mentors.push({
                    name: item.name != undefined ? item.name : "",
                    avatar: item.avatar != undefined && item.avatar != "" ? item.avatar : "/images/cream_pixels.png",
                    username: item.username,
                    skills: item.skills != undefined ? item.skills : [],
                    available: item.available,

                    hasAvatar: true,
                    slackUrl: "https://devict.slack.com/team/" + item.username,
                    availableText: item.available ? "Yes" : "No"
                });
            }
        });
    }

    $.ajax({
        url : '/data/mentors.json',
        type: 'GET',
        success : function(data) {
            ko.applyBindings(new MentorData(data));

			$("#loading").addClass("hidden");
    		$("#mentors").removeClass("hidden");
    	}
    })  
})