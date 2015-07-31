class SocietyController < ApplicationController
  def index
    @head = "Society"
      # impressionist :actions=>[:index]
  end

  def show
    @head = "Society"
    # impressionist(@news, "show page")
  end
end
