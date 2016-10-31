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
  <template v-if="mentors.length > 0">
    <div class="well" style="margin: 30px 0;">
        <form id="search">
          <div class="form-group">
            <input class="form-control" placeholder="Search by skill" name="query" v-model="searchQuery">
          </div>
          <div class="form-group">
            <label>
              <input type="checkbox" v-model="showOnlyAvailable"> Show only available mentors
            </label>
          </div>
        </form>
    </div>
    <template v-if="filteredMentors[0] && filteredMentors[0].length > 0">
      <div class="row">
        <div class="col-sm-6" v-for="column in filteredMentors">
          <div class="mentor panel panel-default" v-for="mentor in column">
            <div class="panel-body">
              <div class="media">
                <div class="media-left">
                  <img v-if="mentor.avatar" class="media-object" :src="mentor.avatar" :alt="mentor.name" style="width: 64px; height: auto;">
                  <div v-else style="width: 64px; height: 64px; background: #eee; position: relative; overflow: hidden;">
                    <i class="fa fa-user fa-4x fa-stack-1x" style="color: #aaa;" aria-hidden="true"></i>
                  </div>
                  <div v-if="mentor.available" class="availability">Available</div>
                  <div v-else="mentor.available" class="availability availability-taken">Taken</div>
                </div>
                <div class="media-body">
                  <h2 class="media-heading h4">{{mentor.name}}</h2>
                  <small class="text-muted">{{mentor.username}}</small>
                  <div class="skills">
                    <span class="label label-default" style="display: inline-block; margin-right: 4px;" v-for="skill in mentor.skills">{{skill}}</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </template>
    <template v-else>
      <div class="alert alert-info">
        Sorry, we couldn't find any mentors matching your skill criteria, try refining your search.
      </div>
    </template>
  </template>
  <template v-else>
    <div class="text-center">
      <i class="fa fa-cog fa-spin fa-5x"></i>
    </div>
  </template>
</div>
