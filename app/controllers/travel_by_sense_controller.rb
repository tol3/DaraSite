class TravelBySenseController < ApplicationController
  def index
    @head = "Travel By Sense & Scene"
      # impressionist :actions=>[:index]
  end

  def show
    @head = "Travel By Sense & Scene"
    # impressionist(@news, "show page")
  end
end
