class LakornController < ApplicationController
  def index
    @head = "Lakorn"
    # impressionist :actions=>[:index]
  end

  def show
    @head = "Lakorn"
    # impressionist(@news, "show page")
  end
end
