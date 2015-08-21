class MyIdolController < ApplicationController

  impressionist :actions=>[:index]

  def index
    @head = "My Idol"
    @url = "myidol"
    @news = News.idol.publish.reverse_order.page(params[:page]).per(16)
    @first = News.idol.publish.reverse_order.first

    #ads
    ads_heads = Adsense.idol.head.publish.sample(2) #header
    @ads_head = ads_heads[0]
    @ads_box = Adsense.idol.box.publish.sample(2) #box
    @ads_lg = Adsense.idol.box.publish.sample(2)[0] #lg
    @ads_bottom = ads_heads[1]

  end

  def show
    @title = "My Idol"
    @url = "myidol"
    @news = News.idol.find(params[:id])
    @head = @news.title
    @like_this = News.idol.publish.reverse_order.sample(6)

    impressionist(@news, "show page")

    #ads
    ads_heads = Adsense.idol.head.publish.sample(2) #header
    @ads_head = ads_heads[0]
    @ads_box = Adsense.idol.box.publish.sample(2) #box
    @ads_lg = Adsense.idol.box.publish.sample(2)[0] #lg
    @ads_bottom = ads_heads[1]

  end
end
