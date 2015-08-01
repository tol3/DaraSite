class MusicController < ApplicationController

  impressionist :actions=>[:index]

  def index
    @head = "Music"
    @url = "music"
    @news = News.music.publish.reverse_order.page(params[:page]).per(16)
    @first = News.music.publish.reverse_order.first
  end

  def show
    @title = "Music"
    @url = "music"
		@news = News.find(params[:id])
    @head = @news.title
    @like_this = News.music.publish.reverse_order.sample(6)

    impressionist(@news, "show page")
  end
end
