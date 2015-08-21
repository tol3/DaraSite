class MusicController < ApplicationController

  impressionist :actions=>[:index]

  def index
    @head = "Music"
    @url = "music"
    @news = News.music.publish.reverse_order.page(params[:page]).per(16)
    @first = News.music.publish.reverse_order.first

    #ads
    ads_heads = Adsense.music.head.publish.sample(2) #header
    @ads_head = ads_heads[0]
    @ads_box = Adsense.music.box.publish.sample(2) #box
    @ads_lg = Adsense.music.box.publish.sample(2)[0] #lg
    @ads_bottom = ads_heads[1]

  end

  def show
    @title = "Music"
    @url = "music"
		@news = News.music.find(params[:id])
    @head = @news.title
    @like_this = News.music.publish.reverse_order.sample(6)

    impressionist(@news, "show page")

    #ads
    ads_heads = Adsense.music.head.publish.sample(2) #header
    @ads_head = ads_heads[0]
    @ads_box = Adsense.music.box.publish.sample(2) #box
    @ads_lg = Adsense.music.box.publish.sample(2)[0] #lg
    @ads_bottom = ads_heads[1]

  end
end
