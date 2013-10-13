class SubmissionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :has_solution, :except => [:new, :create]
  before_filter :owns_submission, :only => [:destroy, :edit, :update]

  def index
    @submissions = Submission.where("challenge_id = ?", params[:challenge_id]).order("created_at").page(params[:page]).per(5)
    @challenge = Challenge.find(params[:challenge_id])
    #including a new, empty comment here allows us to use form_for(@comment) in the view.

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @submissions }
    end
  end

  def show
    @submission = Submission.find(params[:id])
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @submission }
    end
  end

  def new
    @challenge = Challenge.find(params[:challenge_id])
    @submission = Submission.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @submission }
    end
  end

  def edit
    @submission = Submission.find(params[:id])
    @challenge = @submission.challenge
  end

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @submission = Submission.new(params[:submission])
    @submission.user = current_user
    @submission.challenge = @challenge

    respond_to do |format|
      if @submission.save
        format.html { redirect_to challenge_submission_url(@challenge, @submission), notice: 'Submission was successfully created.' }
        format.json { render json: @submission, status: :created, location: @submission }
      else
        format.html { render action: "new" }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @submission = Submission.find(params[:id])
    @challenge = @submission.challenge

    respond_to do |format|
      if @submission.update_attributes(params[:submission])
        format.html { redirect_to challenge_submission_url(@challenge, @submission), notice: 'Submission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy

    respond_to do |format|
      format.html { redirect_to challenge_submissions_url }
      format.json { head :no_content }
    end
  end

  private

  def has_solution
    @challenge = Challenge.find(params[:challenge_id])
    @submissions = Submission.where("challenge_id = ? AND user_id = ?", params[:challenge_id], current_user.id)

    if 0 == @submissions.size
      flash[:error] = "You cannot view other solutions until you have submitted your own."
      redirect_to challenge_path @challenge
    end
  end

  def owns_submission
    @submission = Submission.find(params[:id])

    if current_user != @submission.user
      flash[:error] = 'You cannot modify a submission you did not create'
      redirect_to challenge_submission_path @submission.challenge, @submission
    end
  end
end
