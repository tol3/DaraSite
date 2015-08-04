class SocietyController < ApplicationController

  impressionist :actions=>[:index]

  def index
    @head = "Society"
    @url = "society"
    @news = News.socciety.publish.reverse_order.page(params[:page]).per(16)
    @first = News.socciety.publish.reverse_order.first
  end

  def show
    @title = "Society"
    @url = "society"
		@news = News.socciety.find(params[:id])
    @head = @news.title
    @like_this = News.socciety.publish.reverse_order.sample(6)

    impressionist(@news, "show page")
  end
end
