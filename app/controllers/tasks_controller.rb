class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks
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
    if @task.update(task_params)
      redirect_to @task
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def task_params
    params.require(:task).permit(:title, :description, :is_done, :project_id, tag_ids: [])
  end

  def set_task
    @task = current_user.tasks.find_by(id: params[:id])

    redirect_to tasks_path if !@task
  end
end
