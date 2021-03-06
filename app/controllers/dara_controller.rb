class DaraController < ApplicationController
  # impressionist :actions=>[:index]
  def index
    #ads
    index_head = Adsense.index.head.publish.sample(2) #header
    @ads_head = index_head[0]
    @ads_bottom = index_head[1]
    @ads_box = Adsense.index.box.publish.sample(2) #box
    @ads_side = Adsense.index.side.publish.sample(1)[0] #side
    # @ads_box = Adsense.index.box.publish.sample(2) #box

    # Sample
    @sample = News.publish.last(4)

    # News
    @gossip = News.gossip.publish.reverse_order.limit(4)
    @hot_clip = News.hot_clip.publish.reverse_order.limit(4)
    @movie = News.movie.publish.reverse_order.limit(4)
    @lakorn = News.lakorn.publish.reverse_order.limit(4)
    @music = News.music.publish.reverse_order.limit(4)
    @society = News.socciety.publish.reverse_order.limit(3)
    @idol = News.idol.publish.reverse_order.limit(3)
    @beauty = News.beauty.publish.reverse_order.limit(10)
    @life_style = News.life_style.publish.reverse_order.limit(7)
    @travel = News.travel.publish.reverse_order.limit(4)

    # Party
    @calendar = Party.party.publish.reverse_order.limit(4)
    @chill = Party.chill.publish.reverse_order.limit(4)
    @after_party = Party.prev.publish.reverse_order.limit(4)

    # Event
    @event = Party.event.publish.reverse_order.limit(3)
  end

  def contact
    @head = "Contact"

  end

  def about
    @head = "About"

  end

  def search
  	News.reindex
  	Party.reindex
  	if params[:search]
  		@search = params[:search]
      @res = []
  		news = News.search @search, operator: "or", where: {publish: true}
  		party = Party.search @search, operator: "or", where: {publish: true}

      news.each do |x|
        @res << x
      end

      party.each do |x|
        @res << x
      end

      @res = Kaminari.paginate_array(@res).page(params[:page]).per(30)

  	else
  		@search = ""
			@news = News.where(publish: true)
  		@party = Party.where(publish: true)

  	end

  end
end
