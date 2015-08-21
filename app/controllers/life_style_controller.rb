class LifeStyleController < ApplicationController

  impressionist :actions=>[:index]

  def index
    @head = "LifeStyle"
    @url = "lifestyle"
    @news = News.life_style.publish.reverse_order.page(params[:page]).per(16)
    @first = News.life_style.publish.reverse_order.first

    #ads
    ads_heads = Adsense.lifestyle.head.publish.sample(2) #header
    @ads_head = ads_heads[0]
    @ads_box = Adsense.lifestyle.box.publish.sample(2) #box
    @ads_lg = Adsense.lifestyle.box.publish.sample(2)[0] #lg
    @ads_bottom = ads_heads[1]

  end

  def show
    @title = "LifeStyle"
    @url = "lifestyle"
    @news = News.life_style.find(params[:id])
    @head = @news.title
    @like_this = News.life_style.publish.reverse_order.sample(6)

    impressionist(@news, "show page")

    #ads
    ads_heads = Adsense.lifestyle.head.publish.sample(2) #header
    @ads_head = ads_heads[0]
    @ads_box = Adsense.lifestyle.box.publish.sample(2) #box
    @ads_lg = Adsense.lifestyle.box.publish.sample(2)[0] #lg
    @ads_bottom = ads_heads[1]

  end
end
