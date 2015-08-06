class DaraController < ApplicationController
  # impressionist :actions=>[:index]
  def index

    # News
    @gossip = News.gossip.publish.reverse_order.limit(4)
    @hot_clip = News.hot_clip.publish.reverse_order.limit(4)
    @movie = News.movie.publish.reverse_order.limit(4)
    @lakorn = News.lakorn.publish.reverse_order.limit(4)
    @music = News.music.publish.reverse_order.limit(4)
    @society = News.socciety.publish.reverse_order.limit(3)
    @idol = News.idol.publish.reverse_order.limit(3)
    @beauty = News.beauty.publish.reverse_order.limit(10)
    @life_style = News.life_style.publish.reverse_order.limit(9)
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
