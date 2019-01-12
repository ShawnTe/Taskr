class DetailsController < ApplicationController
  before_action :require_login

  def new
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
    @detail = Detail.find(params[:id])
    @task = Task.find(@detail.task_id)

    case @detail.todo_type
    when "SupplyDetail" then render 'supply_details/_form'
    when "ContactDetail" then render 'contact_details/_form'
    end
  end

  def update
    task = Task.find(params[:task_id])
    @detail = Detail.find(params[:id])
    @detail.todo.update(update_todo_from_params)

    redirect_to task
  end

  def check_date
    p params
    @detail = Detail.find(params[:detail_id])
    @task = Task.find(@detail.task_id)
    helpers.check_due_date(@task)
    redirect_to @detail
  end

  def destroy
    detail = Detail.find(params[:id])
    task = Task.find(detail.task_id)
    todo = delete_todo_from_params(detail)
    todo.destroy
    redirect_to task
  end

  private

  def detail_params
    { todo: todo_from_params }
  end

  def todo_from_params
    p params
    p "@@@@@@@@@@@@@"
    case params[:detail][:todo_type]
    when "ContactDetail" then ContactDetail.new(contact_detail_todo_params)
    when "SupplyDetail" then SupplyDetail.new(supply_detail_todo_params)
    end
  end

  def update_todo_from_params
    case params[:detail][:todo_type]
    when "ContactDetail"
      then detail_params = contact_detail_todo_params
    when "SupplyDetail"
      then detail_params = supply_detail_todo_params
    end
    not_blank_params = detail_params.select do |key, value|
      !value.blank?
    end
  end

  def delete_todo_from_params(detail)
    case detail.todo_type
    when "ContactDetail"
      then detail_to_delete = ContactDetail.find(detail.todo_id)
    when "SupplyDetail"
      then detail_to_delete = SupplyDetail.find(detail.todo_id)
    end
    detail_to_delete
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