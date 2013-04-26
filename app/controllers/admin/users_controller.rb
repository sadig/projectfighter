class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users=User.all
    respond_to do |format|
      format.html
      format.json { render :json => @users }
    end
  end

  def edit
    @user=User.find(params[:id])
    Rails.logger.debug(@user)
    respond_to do |format|
      format.html
    end
  end

end
