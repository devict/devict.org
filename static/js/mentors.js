/**
 * Randomly shuffle the order of an array
 * @param  array array
 * @return array The shuffled array
 */
function shuffle(array) {
  var currentIndex = array.length, temporaryValue, randomIndex;
  // While there remain elements to shuffle...
  while (0 !== currentIndex) {
    // Pick a remaining element...
    randomIndex = Math.floor(Math.random() * currentIndex)
    currentIndex -= 1
    // And swap it with the current element.
    temporaryValue = array[currentIndex]
    array[currentIndex] = array[randomIndex]
    array[randomIndex] = temporaryValue
  }

  return array
}

new Vue({
  el: '#mentors',
  data: function () {
    return {
      selectedMentor: null,
      mentors: [],
      searchQuery: '',
      showOnlyAvailable: true
    }
  },
  created: function () {
    var self = this
    $.ajax({
        url : '/data/mentors.json',
        type: 'GET',
        success : function(mentors) {
          self.mentors = shuffle(mentors.map(function (mentor) {
            //create a mentor model with some additional, computed fields
            var slackUrl = mentor.username != undefined && mentor.username != ""
              ? "https://devict.slack.com/messages/@" + mentor.username
              : undefined;

            return {
              name: mentor.name != undefined ? mentor.name : "",
              avatar: mentor.avatar,
              username: mentor.username,
              skills: mentor.skills,
              isAvailable: mentor.available,
              slackUrl: slackUrl
            };
          }));
        }
    })
  },
  computed: {
    filteredMentors: function () {
      var searchQuery = this.searchQuery && this.searchQuery.toLowerCase()
      // Clone the array instead of passing it by reference so the results can
      // be spliced later
      var mentors = this.mentors.slice(0)
      if (searchQuery) {
        mentors = mentors.filter(function (mentor) {
          return String(mentor.skills).toLowerCase().indexOf(searchQuery) > -1
        })
      }
      if (this.showOnlyAvailable) {
        mentors = mentors.filter(function (mentor) {
          return mentor.isAvailable;
        });
      }
      // Split results into two groups so they stack nicely in columns
      return [mentors, mentors.splice(0, Math.floor(mentors.length / 2))]
    }
  },
  methods: {
    openContactDialog: function(username, e) {
      var matchingMentors = this.mentors.filter(function(mentor) {
        return mentor.username == username;
      });
      this.selectedMentor = matchingMentors.length > 0 ? matchingMentors[0] : null;
      console.log("Current mentor: ", this.selectedMentor);
      if ( this.selectedMentor != null ) {
        $('#contact-mentor-modal').modal('show');
      }
      e.preventDefault();
    }
  }
})
