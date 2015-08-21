class LakornController < ApplicationController

  impressionist :actions=>[:index]

  def index
    @head = "Lakorn"
    @url = "lakorn"
 		@news = News.lakorn.publish.reverse_order.page(params[:page]).per(16)
    @first = News.lakorn.publish.reverse_order.first

    #ads
    ads_heads = Adsense.lakorn.head.publish.sample(2) #header
    @ads_head = ads_heads[0]
    @ads_box = Adsense.lakorn.box.publish.sample(2) #box
    @ads_lg = Adsense.lakorn.box.publish.sample(2)[0] #lg
    @ads_bottom = ads_heads[1]

  end

  def show
    @title = "Lakorn"
    @url = "lakorn"
    @news = News.lakorn.find(params[:id])
    @head = @news.title
    @like_this = News.lakorn.publish.reverse_order.sample(6)

    impressionist(@news, "show page")

    #ads
    ads_heads = Adsense.lakorn.head.publish.sample(2) #header
    @ads_head = ads_heads[0]
    @ads_box = Adsense.lakorn.box.publish.sample(2) #box
    @ads_lg = Adsense.lakorn.box.publish.sample(2)[0] #lg
    @ads_bottom = ads_heads[1]

  end
end
