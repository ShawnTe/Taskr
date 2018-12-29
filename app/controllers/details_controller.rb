class DetailsController < ApplicationController

  def new
    p params
    p "****************         **************"
    @detail_type = params[:detail_type]
    @task = Task.find(params[:task_id])
    @detail = Detail.new
    render
  end

  def create
    task = Task.find(params[:task_id])
    detail = task.details.create(detail_params)
    redirect_to task_path(task), redirect_options_for(detail)
  end

  def show
    @detail = Detail.find(params[:id])
    @task = Task.find(@detail.task_id)
  end

  def edit
    @task = Task.find(params[:task][:task_id])
    @detail = Detail.find(params[:id])
    render
  end

  def update
  end

  def check_date
    @detail = Detail.find(7)
    @task = Task.find(@detail.task_id)
    helpers.check_due_date(@task)
    redirect_to @detail
  end

  private

  def detail_params
    { todo: todo_from_params }
  end

  def todo_from_params
    case params[:detail][:todo_type]
    when "ContactDetail" then ContactDetail.new(contact_detail_todo_params)
    when "SupplyDetail" then SupplyDetail.new(supply_detail_todo_params)
    end
  end

  def contact_detail_todo_params
    params.require(:detail).require(:todo).permit(:company, :name, :url, :work_phone, :mobile_phone, :notes, :email, :task_id)
  end

  def supply_detail_todo_params
    params.require(:detail).require(:todo).permit(:name, :size, :quantity, :brand, :model, :source, :source_link, :how_to_link, :image)
  end

  def redirect_options_for(detail)
    if detail.persisted?
      { notice: "Todo created successfully." }
    else
      { alert: "Todo not saved" }
    end
  end

end