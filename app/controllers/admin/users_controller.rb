class Admin::UsersController < ApplicationController
  #load_and_authorize_resource

  def index
    @users=User.all
    respond_to do |format|
      format.html
      format.json { render :json => @users }
    end
  end

  def edit
    @user=User.find(params[:id])
    @roles=Role.all
    Rails.logger.debug(@user)
    respond_to do |format|
      format.html
    end
  end

  def update
    @user=User.find(params[:id])
    @user.name=params[:user][:name]
    @user.email=params[:user][:email]
    @user.roles=Role.find(params[:user][:roles_for_select].reject!{|v| v.empty?})
    @user.deactivated=params[:user][:deactivated]
    respond_to do |format| 
      if @user.save
        format.html { redirect_to(admin_users_path, :notice=>'User %{user} success updated' % {:user=>@user.name}) }
        format.json {head :no_content}
      else
        format.html { render :action => 'edit' }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
end
