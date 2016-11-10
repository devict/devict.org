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
<div id="contact-mentor-modal" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Connect with a mentor</h4>
      </div>
      <div class="modal-body" v-if="selectedMentor">
        <div v-if="selectedMentor.isAvailable">
          <p>{{selectedMentor.name}} is available to mentor in these topics:</p>
          <p class="skills">
            <span class="label label-default" style="display: inline-block; margin-right: 4px;" v-for="skill in selectedMentor.skills">{{skill}}</span>
          </p>
          <p>To get started, <a :href="selectedMentor.slackUrl" target="_blank">send {{selectedMentor.username}} a message on Slack</a>.</p>
        </div>
        <div v-else>
          <p>{{selectedMentor.name}} is currently unavailable for mentorship.</p>
          <p>They have indicated that they have expertise in these topics:</p>
          <p class="skills">
            <span class="label label-default" style="display: inline-block; margin-right: 4px;" v-for="skill in selectedMentor.skills">{{skill}}</span>
          </p>
          <p>They aren't taking on new mentees right now but they would certainly love to chat about those topics.</p>
        </div>
        <p>If you don't have an account on the devICT Slack then go
          <a href="https://devict-slackin.herokuapp.com/" target="_blank" title="Get an invite for devICT slack">here</a>.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
  <template v-if="mentors.length > 0">
    <div class="well" style="margin: 30px 0;">
        <form id="search">
          <div class="form-group">
            <input class="form-control" placeholder="Search by skill" name="query" v-model="searchQuery" v-on:keyup.esc="clearSearchQuery">
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
                  <a href="#" v-on:click="openContactDialog(mentor.username, $event)" title="Connect with them">                  
                    <img v-if="mentor.avatar" class="media-object" :src="mentor.avatar" :alt="mentor.name" style="width: 64px; height: auto;">                    
                    <div v-else style="width: 64px; height: 64px; background: #eee; position: relative; overflow: hidden;">
                      <i class="fa fa-user fa-4x fa-stack-1x" style="color: #aaa;" aria-hidden="true"></i>
                    </div>
                    <div v-if="mentor.isAvailable" class="availability">Available</div>
                    <div v-else="mentor.isAvailable" class="availability availability-taken">Taken</div>
                  </a>
                </div>
                <div class="media-body">
                  <h2 class="media-heading h4" v-on:click="openContactDialog(mentor.username, $event)" role="button">{{mentor.name}}</h2>
                  <small class="text-muted">
                    <a :href="mentor.slackUrl" title="Connect with them on Slack" target="_blank">{{mentor.username}}</a>
                  </small>
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
