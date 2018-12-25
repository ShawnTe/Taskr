class DashboardsController < ApplicationController
  def show
    @tasks = Task.incomplete
  end
end