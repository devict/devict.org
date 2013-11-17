class FeedController < ApplicationController
  before_filter :find_user

  def create
    @feed = Feed.new()
    @feed.user = @user
    @feed.url = params[:feed][:url]
    @feed.approved = @user.isCharter

    respond_to do |format|
      if @feed.save
        format.html { redirect_to edit_user_path(@user), notice: 'Feed successfully added.' }
        format.json { redirect_to @user, status: :created, location: @feed }
      else
        format.html { redirect_to edit_user_path(@user)  } # TODO: I'm not sure redirection is the best way to handle this
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  protected
  def find_user
    @user = User.find(params[:user_id])
  end
end
