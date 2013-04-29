class ProjectsController < ApplicationController
  def index
    @projects = current_user.owned_projects
  end
end
