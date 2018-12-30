class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    user = User.last

    @task = user.tasks.build(task_params)
  if @task.save
      render "add_supply"
    else
      @error_message = "Task not saved. Did you enter a title and due date?"
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    @task.update(last_date_done: Time.new)
    redirect_to root_path
  end

  def destroy
  end

  def add_contact
    @task = Task.find(params[:task_id])
    render "add_contact"
  end

  private

  def task_params
    params.require(:task).permit(:title, :first_due_date, :notes, :frequency_unit, :frequency_number, :date_completed)
  end

end
