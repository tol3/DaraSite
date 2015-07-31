class BeautyByStunningController < ApplicationController
  # impressionist :actions=>[:index]
  def index
    @head = "Beauty By Stunning"
  end

  def show
    @head = "Beauty By Stunning"
    # impressionist(@news, "show page")
  end
end
