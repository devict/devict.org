class IrcUsersController < ApplicationController
  # POST /irc_users.json
  def create
    @irc_user = IrcUser.new(params[:irc_user])

    respond_to do |format|
      if @irc_user.save
        format.json { render json: @irc_user, status: :created, location: @irc_user }
      else
        format.json { render json: @irc_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /irc_users/jacobwalker0814.json
  def destroy
    @irc_user = IrcUser.find_by_handle(params[:id])
    @irc_user.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
