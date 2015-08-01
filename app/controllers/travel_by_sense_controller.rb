class TravelBySenseController < ApplicationController

  impressionist :actions=>[:index]

  def index
    @head = "Travel By Sense & Scene"
    @url = "travel"
    @news = News.travel.publish.reverse_order.page(params[:page]).per(16)
  	@first = News.travel.publish.reverse_order.first
  end

  def show
    @title = "Travel By Sense & Scene"
    @url = "travel"
		@news = News.find(params[:id])
    @head = @news.title
    @like_this = News.travel.publish.reverse_order.sample(6)

    impressionist(@news, "show page")
  end
end
