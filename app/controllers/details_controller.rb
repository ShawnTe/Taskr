class DetailsController < ApplicationController

  def show
    p params
    @detail = Detail.find(params[:id])
  end

  def edit
    @detail = Detail.find(params[:id])
    '****************************'
    @detail.todo
    render
  end
end