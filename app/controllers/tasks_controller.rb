class TasksController < ApplicationController

  def index

  end

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
    @task.update(last_date_done: Time.new)
    redirect_to root_path
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:title, :first_due_date, :notes, :frequency_unit, :frequency_number, :date_completed)
  end
end
