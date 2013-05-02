class TasksController < ApplicationController
  load_and_authorize_resource

  def show
    @task=Task.find(params[:id])
  end

  def update_status
    @project=Project.find(params[:project_id])
    @task=@project.tasks.find(params[:id])
    Rails.logger.debug(params);
    if params[:status]
      @task.status=params[:status]
    end
    respond_to do |format|
      if @task.save
        format.html { redirect_to(@project,:notice=>'Task updated')}
        format.json { head :no_content }
      else
        format.html {render :action => 'show' }
        format.json { render :json => @task.errors, :status => :unprocessable_entity }
      end
    end
  end
end
