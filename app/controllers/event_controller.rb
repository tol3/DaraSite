class EventController < ApplicationController

  impressionist :actions=>[:index]

  def index
    @head = "Event"
    @url = "event"
    @party = Party.event.publish.reverse_order.page(params[:page]).per(9)
    @first = Party.event.publish.reverse_order.first
    @last = Party.event.prev.publish.reverse_order.page(params[:page]).per(6)

    #ads
    ads_heads = Adsense.event.head.publish.sample(2) #header
    @ads_head = ads_heads[0]
    @ads_box = Adsense.event.box.publish.sample(2) #box
    @ads_lg = Adsense.event.box.publish.sample(2)[0] #lg
    @ads_bottom = ads_heads[1]

  end

  def show
    @head = "Event"
    @url = "event"
    @party = Party.event.find(params[:id])
    @title = @party.title
    @like_this = Party.event.publish.reverse_order.sample(8)

    impressionist(@party, "show page")

    #ads
    ads_heads = Adsense.event.head.publish.sample(2) #header
    @ads_head = ads_heads[0]
    @ads_box = Adsense.event.box.publish.sample(2) #box
    @ads_lg = Adsense.event.box.publish.sample(2)[0] #lg
    @ads_bottom = ads_heads[1]

  end
end
