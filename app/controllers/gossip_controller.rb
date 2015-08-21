class GossipController < ApplicationController

  impressionist :actions=>[:index]

  def index
    @head = "Hot Topics"
    @url = "gossip"
    @news = News.gossip.publish.reverse_order.page(params[:page]).per(16)
    @first = News.gossip.publish.reverse_order.first

    #ads
    ads_heads = Adsense.gossip.head.publish.sample(2) #header
    @ads_head = ads_heads[0]
    @ads_box = Adsense.gossip.box.publish.sample(2) #box
    @ads_lg = Adsense.gossip.box.publish.sample(2)[0] #lg
    @ads_bottom = ads_heads[1]
  end

  def show
    @title = "Hot Topics"
    @url = "gossip"
    @news = News.gossip.find(params[:id])
    @head = @news.title
    @like_this = News.gossip.publish.reverse_order.sample(6)

    #ads
    ads_head = Adsense.gossip.head.publish.sample(2) #header
    @ads_head = ads_head[0]
    @ads_box = Adsense.gossip.box.publish.sample(2) #box
    @ads_lg = Adsense.gossip.box.publish.sample(2)[0] #lg
    @ads_bottom = ads_head[1]

    impressionist(@news, "show page")
  end

end
