class MovieController < ApplicationController

  impressionist :actions=>[:index]

  def index
    @head = "Movie"
    @url = "movie"
    @news = News.movie.publish.reverse_order.page(params[:page]).per(16)
    @first = News.movie.publish.reverse_order.first
  end

  def show
    @title = "Movie"
    @url = "movie"
		@news = News.movie.find(params[:id])
    @head = @news.title
    @like_this = News.movie.publish.reverse_order.sample(6)

    impressionist(@news, "show page")
  end
end
