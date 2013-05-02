class TimeRecordsController < ApplicationController

  def stoptimerecord
    @project=Project.find(params[:project_id])
    @task=@project.tasks.find(params[:task_id])
    @timerecord=@task.time_records.find(params[:id])
    @timerecord.started=false
    @timerecord.touch
    respond_to do |format|
      if @timerecord.save
        session[:action]='task_updated'
        session[:task_updated]=@task.id
        format.json { head :no_content }
      else
        format.json { render :json => @timerecord.errors, :status => :nonprocessable_entity }
      end
    end
  end
end
