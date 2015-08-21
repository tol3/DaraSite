class MovieController < ApplicationController

  impressionist :actions=>[:index]

  def index
    @head = "Movie"
    @url = "movie"
    @news = News.movie.publish.reverse_order.page(params[:page]).per(16)
    @first = News.movie.publish.reverse_order.first

    #ads
    ads_heads = Adsense.movie.head.publish.sample(2) #header
    @ads_head = ads_heads[0]
    @ads_box = Adsense.movie.box.publish.sample(2) #box
    @ads_lg = Adsense.movie.box.publish.sample(2)[0] #lg
    @ads_bottom = ads_heads[1]

  end

  def show
    @title = "Movie"
    @url = "movie"
		@news = News.movie.find(params[:id])
    @head = @news.title
    @like_this = News.movie.publish.reverse_order.sample(6)

    impressionist(@news, "show page")

    #ads
    ads_heads = Adsense.movie.head.publish.sample(2) #header
    @ads_head = ads_heads[0]
    @ads_box = Adsense.movie.box.publish.sample(2) #box
    @ads_lg = Adsense.movie.box.publish.sample(2)[0] #lg
    @ads_bottom = ads_heads[1]

  end
end
