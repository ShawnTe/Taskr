class TasksController < ApplicationController
  before_action :require_login

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
    if params[:task].has_key?(:date_completed)
      helpers.completion_tasks @task
      flash[:alert] = "Any changes to make?"
      redirect_to edit_task_path @task
      return
    end
    redirect_to root_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
  end

  def add_contact
    @task = Task.find(params[:task_id])
    render "add_contact"
  end

  private

  def task_params
    params.require(:task).permit(:title, :next_due_date, :notes, :frequency_unit, :frequency_number, :date_completed)
  end

end
