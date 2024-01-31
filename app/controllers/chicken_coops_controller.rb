class ChickenCoopsController < ApplicationController
  def index
    @chickens = ChickenCoop.all
    render json: @chickens
  end
  def show
    chicken = ChickenCoop.find(params[:id])
    render json: chicken
  end
end
