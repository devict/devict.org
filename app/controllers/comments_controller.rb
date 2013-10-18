class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :owns_comment, :only => [:destroy, :edit, :update]

  # decided to keep this, might be handy as an admin tool someday.
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
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
        format.html { redirect_to challenge_submission_path(@comment.submission.challenge, @comment.submission), notice: 'Comment added.' }
      else
        # ideally we'd push back @comment with actual errors. not sure possible/advisable thru redirect.
        flash[:error] = 'Your comment could not be saved. Comments may not be empty.'
        format.html { redirect_to challenge_submission_path(@comment.submission.challenge, @comment.submission) }
      end
    end
  end

  # PUT /comments/1
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to challenge_submission_path(@comment.submission.challenge, @comment.submission), notice: 'Comment was revised.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /comments/1
  def destroy
    @comment = Comment.find(params[:id])
    @challenge = @comment.submission.challenge
    @submission = @comment.submission

    @comment.destroy

    redirect_to challenge_submission_path(@challenge, @submission), notice: 'Comment was removed.'
  end

  def owns_comment
    @comment = Comment.find(params[:id])

    if current_user != @comment.user
      flash[:error] = 'You cannot modify a comment you did not create.'
      redirect_to challenge_submission_path(@comment.submission.challenge, @comment.submission)
    end
  end
end
