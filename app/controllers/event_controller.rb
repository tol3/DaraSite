class EventController < ApplicationController
  def index
    @head = "Event"
    # impressionist :actions=>[:index]
  end

  def show
    @head = "Event"
    # impressionist(@news, "show page")

  end
end
