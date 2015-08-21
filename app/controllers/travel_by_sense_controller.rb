class TravelBySenseController < ApplicationController

  impressionist :actions=>[:index]

  def index
    @head = "Travel By Sense & Scene"
    @url = "travel"
    @news = News.travel.publish.reverse_order.page(params[:page]).per(16)
  	@first = News.travel.publish.reverse_order.first

    #ads
    ads_heads = Adsense.travel.head.publish.sample(2) #header
    @ads_head = ads_heads[0]
    @ads_box = Adsense.travel.box.publish.sample(2) #box
    @ads_lg = Adsense.travel.box.publish.sample(2)[0] #lg
    @ads_bottom = ads_heads[1]

  end

  def show
    @title = "Travel By Sense & Scene"
    @url = "travel"
		@news = News.travel.find(params[:id])
    @head = @news.title
    @like_this = News.travel.publish.reverse_order.sample(6)

    impressionist(@news, "show page")

    #ads
    ads_heads = Adsense.travel.head.publish.sample(2) #header
    @ads_head = ads_heads[0]
    @ads_box = Adsense.travel.box.publish.sample(2) #box
    @ads_lg = Adsense.travel.box.publish.sample(2)[0] #lg
    @ads_bottom = ads_heads[1]

  end
end
