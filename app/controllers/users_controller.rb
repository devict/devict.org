class UsersController < ApplicationController
  before_filter :find_user, :only => [:show, :edit, :update]
  before_filter :redirect_unless_same_user, :only => [:edit, :update]

  def index
    @charter = User.where(isCharter: true).order("name")
    @users = User.where(isCharter: false).order("name")
  end

  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    @services = current_user.services.order('provider asc')
    @feed = Feed.new
    @feed.user = @user
  end

  protected
    def find_user
      @user = User.find(params[:id])
    end

    def redirect_unless_same_user
      if ! user_signed_in? || current_user.id != @user.id
        redirect_to users_path, :flash => { :error => "You do not have permission to edit users other than yourself." }
      end
    end
end
