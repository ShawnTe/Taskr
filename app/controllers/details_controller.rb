class DetailsController < ApplicationController

  def new
    @task = Task.find(params[:task][:task_id])
    @detail = Detail.new
    render
  end

  def create
    task = Task.find(params[:task_id])
    detail = task.details.create(detail_params)
    redirect_to root_path, redirect_options_for(detail)
  end

  def show
    @detail = Detail.find(params[:id])
  end

  def edit
    @task = Task.find(params[:task][:task_id])
    @detail = Detail.find(params[:id])
    # @detail.todo
    render
  end

  def update

  end

  private

  def detail_params
    { todo: todo_from_params }
  end

  def todo_from_params
    ContactDetail.new(todo_params)
  end

  def todo_params
    params.require(:detail).require(:todo).permit(:company, :name, :url, :work_phone, :mobile_phone, :notes, :email, :task_id)
  end

  def redirect_options_for(detail)
    if detail.persisted?
      { notice: "Todo created successfully" }
    else
      { alert: "Todo not saved" }
    end
  end

end