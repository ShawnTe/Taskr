class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    user = User.find([params[:id]])

    @task = user.tasks.build(task_params)
    if @task.save
      redirect_to @task
    else
      render :new
    end
  end

  def show
    @task = Task.first
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:title, :due, :notes, :frequency_unit, :frequency_number)
  end
end
