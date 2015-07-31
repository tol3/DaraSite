class MyIdolController < ApplicationController
  def index
    @head = "My Idol"
    # impressionist :actions=>[:index]
  end

  def show
    @head = "My Idol"
    # impressionist(@news, "show page")
  end
end
