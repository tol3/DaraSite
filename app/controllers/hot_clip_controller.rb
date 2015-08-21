class HotClipController < ApplicationController

  impressionist :actions=>[:index]

  def index
    @head = "Hot Clip"
    @url = "hotclip"
    @news = News.hot_clip.publish.reverse_order.page(params[:page]).per(16)
    @first = News.hot_clip.publish.reverse_order.first

    #ads
    ads_heads = Adsense.hotclip.head.publish.sample(2) #header
    @ads_head = ads_heads[0]
    @ads_box = Adsense.hotclip.box.publish.sample(2) #box
    @ads_lg = Adsense.hotclip.box.publish.sample(2)[0] #lg
    @ads_bottom = ads_heads[1]

  end

  def show
    @title = "Hot Clip"
    @url = "hotclip"
    @news = News.hot_clip.find(params[:id])
    @head = @news.title
    @like_this = News.hot_clip.publish.reverse_order.sample(6)

    impressionist(@news, "show page")

    #ads
    ads_heads = Adsense.hotclip.head.publish.sample(2) #header
    @ads_head = ads_heads[0]
    @ads_box = Adsense.hotclip.box.publish.sample(2) #box
    @ads_lg = Adsense.hotclip.box.publish.sample(2)[0] #lg
    @ads_bottom = ads_heads[1]

  end
end
