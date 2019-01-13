class DashboardsController < ApplicationController
  def show
    @tasks = Task.incomplete.order('next_due_date ASC')
  end
end