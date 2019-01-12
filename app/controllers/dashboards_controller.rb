class DashboardsController < ApplicationController
  # before_action :require_login

  def show
    @tasks = Task.incomplete.order('next_due_date ASC')
  end
end