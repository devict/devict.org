class ChallengesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :owns_challenge, :only => [:destroy, :edit, :update]

  def index
    @challenges = Challenge.order("created_at DESC").page(params[:page]).per(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @challenges }
    end
  end

  def show
    @challenge = Challenge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @challenge }
    end
  end

  def new
    @challenge = Challenge.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @challenge }
    end
  end

  def edit
    @challenge = Challenge.find(params[:id])
  end

  def create
    @challenge = Challenge.new(params[:challenge])
    @challenge.user = current_user

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to @challenge, notice: 'Challenge was successfully created.' }
        format.json { render json: @challenge, status: :created, location: @challenge }
      else
        format.html { render action: "new" }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @challenge = Challenge.find(params[:id])

    respond_to do |format|
      if @challenge.update_attributes(params[:challenge])
        format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy

    respond_to do |format|
      format.html { redirect_to challenges_url }
      format.json { head :no_content }
    end
  end

  private
  
  def owns_challenge
    @challenge = Challenge.find(params[:id])

    if current_user != @challenge.user
      flash[:error] = 'You cannot modify a challenge you did not create'
      redirect_to challenge_path @challenge
    end
  end
end
