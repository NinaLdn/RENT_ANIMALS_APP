class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy]

  def index
    #@animals = Animal.all
    @animal = policy_scope(Animal)

  end

  def show
    # @animal = Animal.find(params[:id])
    @booking = Booking.new
  end

  def new
    @animal = Animal.new
    autorize @restaurant
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user.animals.build(animal_params)
    authorize @restaurant
    if @animal.save
      # to do
      redirect_to animals_path
    else
      render :new
    end
  end

  def edit
    # @animal = Animal.find(params[:id])
  end

  def update
    #@animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      redirect_to animal_path(@animal)
    else
      render :edit
    end
  end

  def destroy
    # @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to animals_path
  end

  def ads
    @animals = Animal.where(user: current_user)
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
    autorize @animal
  end

  def animal_params
    params.require(:animal).permit(:name, :category, :price, :description, :photo)
  end
end
