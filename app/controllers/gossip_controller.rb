class GossipController < ApplicationController

  impressionist :actions=>[:index]

  def index
    @head = "Gossip"
    @news = News.music.publish.reverse_order.page(params[:page]).per(15)
    @first = News.music.publish.reverse_order.first
  end

  def show
    @title = "Gossip"
    @news = News.find(params[:id])
    @head = @news.title
    @like_this = News.music.publish.reverse_order.sample(6)

    impressionist(@news, "show page")
  end

end
