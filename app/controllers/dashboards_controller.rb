class DashboardsController < ApplicationController

  def show
    @tasks = current_user.tasks.incomplete.order('next_due_date ASC')
  end
end