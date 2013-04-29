class TasksController < ApplicationController
  load_and_authorize_resource

  def show
    @task=Task.find(params[:id])
  end
end
