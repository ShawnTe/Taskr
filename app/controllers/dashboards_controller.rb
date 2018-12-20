class DashboardsController < ApplicationController
  def show
    @tasks = Task.order('first_due_date DESC')
  end
end