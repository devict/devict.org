+++
title = "Mentors"
scripts = [
  "https://unpkg.com/vue@next/dist/vue.js",
  "/js/mentors.js"
]
+++

Mentors are available to offer their expertise to others. Use this page to
search for someone with a specific skill then reach out to them on Slack.
Everyone listed here has explicitly volunteered to be a mentor so don't
hesitate to reach out!

<div id="mentors">
  <div v-if="mentors.length < 0" class="text-center"><i class="fa fa-cog fa-spin fa-5x"></i></div>
  <div v-else>
    <form id="search" style="margin: 30px 0;">
      <input class="form-control" placeholder="Search by skills" name="query" v-model="searchQuery">
    </form>
    <div v-if="filteredMentors.length > 0">
      <div class="row">
        <div class="col-sm-6 col-md-4" v-for="mentor in filteredMentors">
          <div class="panel panel-default">
            <div class="panel-heading">
              {{mentor.name}} <small class="text-muted">&middot; {{mentor.username}}</small>
              <span v-if="mentor.available" class="badge pull-right" style="background-color: rgba(238,128,43,1);">Available</span>
            </div>
            <div class="panel-body">
              <span class="label label-default" style="display: inline-block; margin-right: 4px;" v-for="skill in mentor.skills">{{skill}}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div v-else>
      <div class="alert alert-info">
        Sorry, we couldn't find any mentors matching your skill criteria, try refining your search.
      </div>
    </div>
  </div>
</div>
