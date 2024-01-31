class ChickenCoopsController < ApplicationController
  def index
    @chickens = ChickenCoop.all
    render json: @chickens
  end
  def show
    chicken = ChickenCoop.find(params[:id])
    render json: chicken
  end
  def create
    chicken = ChickenCoop.create(chicken_params)
    if chicken.valid?
      render json: chicken
    else
      render json: chicken.errors
    end
  end

  private
  def chicken_params
    params.require(:chicken_coop).permit(:name, :variant, :origin)
  end

end
