class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects
  end

  def show

  end

  def new
    position = current_user.projects.empty? ? 1 : current_user.projects.last.position + 1
    @project = current_user.projects.build(position: position)
  end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to @project
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @project.update(project_params)
      redirect_to @project
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy

    redirect_to projects_path, status: :see_other
  end

  private
  def project_params
    params.require(:project).permit(:title, :position)
  end

  def set_project
    @project = current_user.projects.find_by(id: params[:id])

    redirect_to projects_path if !@project
  end
end
