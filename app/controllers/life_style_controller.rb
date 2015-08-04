class LifeStyleController < ApplicationController

  impressionist :actions=>[:index]

  def index
    @head = "Life Style"
    @url = "lifestyle"
    @news = News.life_style.publish.reverse_order.page(params[:page]).per(16)
    @first = News.life_style.publish.reverse_order.first
  end

  def show
    @title = "Life Style"
    @url = "lifestyle"
    @news = News.life_style.find(params[:id])
    @head = @news.title
    @like_this = News.life_style.publish.reverse_order.sample(6)

    impressionist(@news, "show page")
  end
end
