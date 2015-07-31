class LifeStyleController < ApplicationController
  def index
    @head = "Life Style"
    # impressionist :actions=>[:index]
  end

  def show
    @head = "Life Style"
    # impressionist(@news, "show page")
  end
end
