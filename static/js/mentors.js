new Vue({
  el: '#mentors',
  data: function () {
    return {
      mentors: [],
      searchQuery: ''
    }
  },
  created: function () {
    var self = this
    $.ajax({
        url : '/data/mentors.json',
        type: 'GET',
        success : function(mentors) {
          self.mentors = mentors
        }
    })
  },
  computed: {
    filteredMentors: function () {
      var searchQuery = this.searchQuery && this.searchQuery.toLowerCase()
      var mentors = this.mentors
      if (searchQuery) {
        mentors = mentors.filter(function (mentor) {
          return String(mentor.skills).toLowerCase().indexOf(searchQuery) > -1
        })
      }
      return mentors
    }
  },
})
