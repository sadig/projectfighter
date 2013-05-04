class TasksController < ApplicationController
  load_and_authorize_resource

  def show
    @task=Task.find(params[:id])
  end

  def startwork
    @project=Project.find(params[:project_id])
    @task=@project.tasks.find(params[:id])
    if @task.time_records.where(:first => true).count > 0
      t=TimeRecord.create(:task=>@task, :started=>true, :first=>false)
    else
      t=TimeRecord.create(:task=>@task, :started=>true, :first=>true)
    end
    @task.status='in_progress'
    @task.save
    respond_to do |format|
      session[:action]='task_updated'
      session[:task_updated]=@task.id
      format.json { head :no_content }
    end
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
        if @task.status=='new' or @task.status=='done'
          trecord=@task.time_records.where(:started=>true).first
          if trecord != nil
            trecord.started=false
            trecord.save
          end
        end
        if @task.status=='in_progress'
          if @task.time_records.all.count == 0
            TimeRecord.create(:task=>@task, :started=>true, :first=>true)
          else
            TimeRecord.create(:task=>@task, :started=>true, :first=>false)
          end
        end
        if @task.status=='done'
        end
        session[:action]='task_updated'
        session[:task_updated]=@task.id
        format.html { redirect_to(@project,:notice=>'Task updated')}
        format.json { head :no_content }
      else
        format.html {render :action => 'show' }
        format.json { render :json => @task.errors, :status => :unprocessable_entity }
      end
    end
  end
end
