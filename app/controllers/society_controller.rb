class SocietyController < ApplicationController

  impressionist :actions=>[:index]

  def index
    @head = "Society"
    @url = "society"
    @news = News.socciety.publish.reverse_order.page(params[:page]).per(16)
    @first = News.socciety.publish.reverse_order.first

    #ads
    ads_heads = Adsense.socciety.head.publish.sample(2) #header
    @ads_head = ads_heads[0]
    @ads_box = Adsense.socciety.box.publish.sample(2) #box
    @ads_lg = Adsense.socciety.box.publish.sample(2)[0] #lg
    @ads_bottom = ads_heads[1]

  end

  def show
    @title = "Society"
    @url = "society"
		@news = News.socciety.find(params[:id])
    @head = @news.title
    @like_this = News.socciety.publish.reverse_order.sample(6)

    impressionist(@news, "show page")

    #ads
    ads_heads = Adsense.socciety.head.publish.sample(2) #header
    @ads_head = ads_heads[0]
    @ads_box = Adsense.socciety.box.publish.sample(2) #box
    @ads_lg = Adsense.socciety.box.publish.sample(2)[0] #lg
    @ads_bottom = ads_heads[1]

  end
end
