class PagesController < ApplicationController
  def home
    @animals = Animal.first(3)
  end
end
