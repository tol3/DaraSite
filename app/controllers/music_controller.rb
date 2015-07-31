class MusicController < ApplicationController
  def index
    @head = "Music"
    # impressionist :actions=>[:index]
  end

  def show
    @head = "Music"
    # impressionist(@news, "show page")
  end
end
