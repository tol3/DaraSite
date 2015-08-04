class LakornController < ApplicationController

  impressionist :actions=>[:index]

  def index
    @head = "Lakorn"
    @url = "lakorn"
 		@news = News.lakorn.publish.reverse_order.page(params[:page]).per(16)
    @first = News.lakorn.publish.reverse_order.first
  end

  def show
    @title = "Lakorn"
    @url = "lakorn"
    @news = News.lakorn.find(params[:id])
    @head = @news.title
    @like_this = News.lakorn.publish.reverse_order.sample(6)

    impressionist(@news, "show page")
  end
end
