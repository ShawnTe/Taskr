class DashboardsController < ApplicationController
  def show
    @tasks = Task.incomplete.order('first_due_date ASC')
  end
end