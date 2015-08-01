class BeautyByStunningController < ApplicationController

  impressionist :actions=>[:index]

  def index
    @head = "Beauty By Stunning"
    @url = "beauty"
    @news = News.beauty.publish.reverse_order.page(params[:page]).per(16)
    @first = News.beauty.publish.reverse_order.first
  end

  def show
    @title = "Beauty By Stunning"
    @url = "beauty"
    @news = News.find(params[:id])
    @head = @news.title
    @like_this = News.beauty.publish.reverse_order.sample(6)

    impressionist(@news, "show page")
  end
end
