class ChickenCoopsController < ApplicationController
  def index
    @chickens = ChickenCoop.all
    render json: @chickens
  end
end
