class DetailsController < ApplicationController

  def show
    p params
    @detail = Detail.find(params[:id])
  end
end