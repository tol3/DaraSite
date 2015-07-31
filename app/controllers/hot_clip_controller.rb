class HotClipController < ApplicationController
  def index
    @head = "Hot Clip"
    # impressionist :actions=>[:index]
  end

  def show
    @head = "Hot Clip"
    # impressionist(@news, "show page")
  end
end
