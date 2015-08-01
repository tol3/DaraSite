class MyIdolController < ApplicationController

  impressionist :actions=>[:index]

  def index
    @head = "My Idol"
    @url = "myidol"
    @news = News.idol.publish.reverse_order.page(params[:page]).per(16)
    @first = News.idol.publish.reverse_order.first
  end

  def show
    @title = "My Idol"
    @url = "myidol"
    @news = News.find(params[:id])
    @head = @news.title
    @like_this = News.idol.publish.reverse_order.sample(6)

    impressionist(@news, "show page")
  end
end
