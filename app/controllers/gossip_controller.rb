class GossipController < ApplicationController

  impressionist :actions=>[:index]

  def index
    @head = "Gossip"
    @url = "gossip"
    @news = News.gossip.publish.reverse_order.page(params[:page]).per(16)
    @first = News.gossip.publish.reverse_order.first
  end

  def show
    @title = "Gossip"
    @url = "gossip"
    @news = News.find(params[:id])
    @head = @news.title
    @like_this = News.gossip.publish.reverse_order.sample(6)

    impressionist(@news, "show page")
  end

end
