class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :owns_comment, :only => [:destroy, :edit, :update]

  #MWCTODOs:
  # edit form has bad stuff like Show on it that needs removed.
  # need at least a little styling to separate submissions/comments, currently it's almost unreadable.
  # not too sure about making submission_id attr_accessible. could avoid with a bit extra code.
  # delete is being weird and not redirecting where it's supposed to.
  # error scenarios need handled and tested.
  # probably ought to test owns_comment with hacked edit (remove :edit above from before_filter to do this) 
  # rm the show/new erbs.

  # decided to keep this, might be handy as an admin tool someday.
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @comments }
    end
  end

  #deleted "show", "new" scaffolding

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to challenge_submissions_path(:challenge_id => @comment.submission.challenge.id), notice: 'Comment was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /comments/1
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to challenge_submissions_path(:challenge_id => @comment.submission.challenge.id), notice: 'Comment was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /comments/1
  def destroy
    @comment = Comment.find(params[:id])
    @challenge_id = @comment.submission.challenge.id
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to challenge_submissions_path(:challenge_id => @challenge_id), notice: 'Comment was removed.' }
    end
  end

  def owns_comment
    @comment = Comment.find(params[:id])

    if current_user != @comment.user
      flash[:error] = 'You cannot modify a comment you did not create'
      redirect_to submission_path redirect_to challenge_submissions_path(:challenge_id => @comment.submission.challenge.id)
    end
  end
end
