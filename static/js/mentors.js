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

  return array;
}

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
          self.mentors = shuffle(mentors)
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
  }
})
