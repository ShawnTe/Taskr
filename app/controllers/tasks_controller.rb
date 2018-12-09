class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    user = User.new({username: "sample-user"})

    @task = user.tasks.build(task_params)
    if @task.save
      p "task created successfully"
      redirect_to @task
    else
      render :new
    end
  end

  def show
    @task = Task.last
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
