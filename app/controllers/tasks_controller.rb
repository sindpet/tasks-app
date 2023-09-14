class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :validate_project_id, only: [:index]

  def index
    @tasks = current_user.tasks

    @tasks = @tasks.where(project_id: params[:project_id]) if params.has_key?(:project_id)

    @tasks = @tasks.finished if params[:scope] == "finished"
    @tasks = @tasks.unfinished if params[:scope] == "unfinished"

    @pagy, @tasks = pagy(@tasks)
  end

  def show

  end

  def new
    @task = current_user.tasks.build()
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to @task
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.turbo_stream
        format.html { redirect_to @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy

    redirect_to tasks_path, status: :see_other
  end

  private
  def task_params
    params.require(:task).permit(:title, :description, :is_done, :file, :project_id, tag_ids: [])
  end

  def set_task
    @task = current_user.tasks.find_by(id: params[:id])

    redirect_to tasks_path if !@task
  end

  def validate_project_id
    redirect_to projects_path if params[:project_id] && ! current_user.projects.find_by(id: params[:project_id])
  end
end
