class DashboardsController < ApplicationController
  def show
    @tasks = Task.all
  end
end