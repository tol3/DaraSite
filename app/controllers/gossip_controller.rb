class GossipController < ApplicationController

  impressionist :actions=>[:index]
  # <%= Impression.group_by_day(:created_at).count %>

  def index
    @head = "Gossip"
    @news = News.music.publish
  end

  def show
    @news = News.find(params[:id])
    @head = @news.title
    impressionist(@news, "show page")
  end

end
