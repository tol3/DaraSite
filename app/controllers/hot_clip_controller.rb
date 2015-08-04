class HotClipController < ApplicationController

  impressionist :actions=>[:index]

  def index
    @head = "Hot Clip"
    @url = "hotclip"
    @news = News.hot_clip.publish.reverse_order.page(params[:page]).per(16)
    @first = News.hot_clip.publish.reverse_order.first
  end

  def show
    @title = "Hot Clip"
    @url = "hotclip"
    @news = News.hot_clip.find(params[:id])
    @head = @news.title
    @like_this = News.hot_clip.publish.reverse_order.sample(6)

    impressionist(@news, "show page")
  end
end
