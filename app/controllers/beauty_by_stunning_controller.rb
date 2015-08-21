class BeautyByStunningController < ApplicationController

  impressionist :actions=>[:index]

  def index
    @head = "Beauty By Stunning"
    @url = "beauty"
    @news = News.beauty.publish.reverse_order.page(params[:page]).per(16)
    @first = News.beauty.publish.reverse_order.first

    #ads
    ads_heads = Adsense.beauty.head.publish.sample(2) #header
    @ads_head = ads_heads[0]
    @ads_box = Adsense.beauty.box.publish.sample(2) #box
    @ads_lg = Adsense.beauty.box.publish.sample(2)[0] #lg
    @ads_bottom = ads_heads[1]
  end

  def show
    @title = "Beauty By Stunning"
    @url = "beauty"
    @news = News.beauty.find(params[:id])
    @head = @news.title
    @like_this = News.beauty.publish.reverse_order.sample(6)

    impressionist(@news, "show page")

    #ads
    ads_heads = Adsense.beauty.head.publish.sample(2) #header
    @ads_head = ads_heads[0]
    @ads_box = Adsense.beauty.box.publish.sample(2) #box
    @ads_lg = Adsense.beauty.box.publish.sample(2)[0] #lg
    @ads_bottom = ads_heads[1]
  end
end
