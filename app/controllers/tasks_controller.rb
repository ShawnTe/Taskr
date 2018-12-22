class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    user = User.last

    @task = user.tasks.build(task_params)
  if @task.save
      redirect_to @task
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
    helpers.check_due_date(@task)
  end

  def edit
  end

  def update
    p task_params
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to root_path
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:title, :due, :notes, :frequency_unit, :frequency_number, :date_completed)
  end
end
