class DashboardsController < ApplicationController
  def show
    @tasks = Task.order('due DESC')
  end
end