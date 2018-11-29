class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = " \
        animals.category ILIKE :query \
        OR animals.description ILIKE :query \
        OR animals.name ILIKE :query \
      "
      @animals = Animal.where(sql_query, query: "%#{params[:query]}%").where.not(latitude: nil, longitude: nil)
      @markers = @animals.map do |animal|
      {
        lng: animal.longitude,
        lat: animal.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { animal: animal })
      }
      end
    else
      @animals = Animal.where.not(latitude: nil, longitude: nil)
      @markers = @animals.map do |animal|
        {
          lng: animal.longitude,
          lat: animal.latitude,
          infoWindow: render_to_string(partial: "infowindow", locals: { animal: animal })
        }
      end
    end
  end

  def show
    # @animal = Animal.find(params[:id])
    @booking = Booking.new
    @review = Review.new
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user
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
  end

  def animal_params
    params.require(:animal).permit(:name, :category, :description, :price, :photo, :address)
  end
end
