class MovieController < ApplicationController
  def index
    @head = "Movie"
    # impressionist :actions=>[:index]
  end

  def show
    @head = "Movie"
    # impressionist(@news, "show page")
  end
end
