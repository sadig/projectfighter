class ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    @projects = current_user.owned_projects
  end

  def show
    @project=Project.find(params[:id])
  end

  def new
  end

  def create
    @project=Project.new
    @project.owner=current_user
    @project.slug=params[:project][:slug]
    @project.title=params[:project][:title]
    @project.description=params[:project][:description]
    respond_to do |format|
      if @project.save
        format.html { redirect_to(projects_path, :notice => 'Project %{slug} created successfully!' % { :slug=>@project.slug})}
        format.json { header :no_content }
      else
        format.html { render :action => :new }
        format.json { render :json => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
  end
end
