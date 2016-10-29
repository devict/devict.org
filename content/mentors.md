+++
title = "Mentors"
scripts = [
  "https://cdnjs.cloudflare.com/ajax/libs/knockout/3.4.0/knockout-min.js",
  "/js/mentors.js"
]
+++

Mentors are available to offer their expertise to others. Use this page to
search for someone with a specific skill then reach out to them on Slack.
Everyone listed here has explicitly volunteered to be a mentor so don't
hesitate to reach out!

<form>
  <div class="form-group">
    <label for="mentorSearchText">Search for mentors</label>
    <input type="text" 
      id="mentorSearchText"
      class="form-control" 
      placeholder="Enter a name or skills to learn"
      disabled />
  </div>
  <div class="form-group">
    <label>
      <input type="checkbox" disabled> Show only available mentors
    </label>
  </div>
</form>

<div id="loading" class="text-center">
  <i class="fa fa-cog fa-spin fa-5x"></i>
</div>

<div id="mentors" class="hidden" data-bind="foreach: mentors">
  <div class="panel panel-default">
    <div class="panel-body media">
      <div class="media-left" data-bind="visible: hasAvatar">    
        <a href="#" data-bind="attr: {href: slackUrl}">
          <img class="media-object media-object-medium" data-bind="attr: {src: avatar}" />
        </a>
      </div>
      <div class="media-body">
        <h4 class="media-heading">
          <span data-bind="text: name"></span>    
          (<a href="#" data-bind="text: username, attr: {href: slackUrl}"></a>)
        </h4>
        <div>
          <b>Available: </b><span data-bind="text: availableText"></span>
        </div>
        <div>
          <b>Skills: </b>
          <span data-bind="foreach: skills">
            <span class="label label-primary" data-bind="text: $data"></span>
          </span>
        </div>
      </div>
    </div>
  </div>
</div>
