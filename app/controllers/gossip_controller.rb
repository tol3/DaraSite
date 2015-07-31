class GossipController < ApplicationController
  def index
    @head = "Gossip"
    # impressionist :actions=>[:index]
  end

  def show
    @head = "Gossip"
    # impressionist(@news, "show page")
  end
end
