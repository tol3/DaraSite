class EventController < ApplicationController

  impressionist :actions=>[:index]

  def index
    @head = "Event"
    @url = "event"
    @party = Party.event.publish.reverse_order.page(params[:page]).per(9)
    @first = Party.event.publish.reverse_order.first
    @last = Party.event.prev.publish.reverse_order.page(params[:page]).per(6)
  end

  def show
    @head = "Event"
    @url = "event"
    @party = Party.event.find(params[:id])
    @title = @party.title
    @like_this = Party.event.publish.reverse_order.sample(8)

    impressionist(@party, "show page")
  end
end
