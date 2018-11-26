class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :destroy]

  def index
    @animals = Animal.all
  end

  def show
    # @animal = Animal.find(params[:id])
  end

  def destroy
    # @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to animals_path
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def animal_params
    params.require(:animal).permit(:name, :category, :price, :description, :user_id)
  end
end
