class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    user = User.last

    @task = user.tasks.build(task_params)
    if @task.save
      # temporary placement for trial run
      TwilioTextMessenger.new("From tasks controller").send_message
      redirect_to @task
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
    p "****************** in Task Controller @task: "
    p "******************"
    p @task
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
