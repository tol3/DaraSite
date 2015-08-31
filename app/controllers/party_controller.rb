class PartyController < ApplicationController

	impressionist :actions=>[:index, :chill_2_night , :after_party]

  def index
		@head = "Party Calendar"
    @url = "party"
    @party = Party.party.publish.reverse_order.page(params[:page]).per(9)
    @first = Party.party.publish.reverse_order.first
    @last = Party.party.prev.publish.reverse_order.page(params[:page]).per(6)

    #ads
    ads_heads = Adsense.party.head.publish.sample(2) #header
    @ads_head = ads_heads[0] #header
    @ads_box = Adsense.party.box.publish.sample(2) #box
    @ads_lg = Adsense.party.box.publish.sample(1)[0] #lg
    @ads_bottom = ads_heads[1] #bottom
  end

  def chill_2_night
		@head = "Chill 2 Night"
    @url = "party"
    @party = Party.party.prev.publish.reverse_order.page(params[:page]).per(9)
    @first = Party.party.publish.reverse_order.first
    @last = Party.party.prev.publish.reverse_order.page(params[:page]).per(6)

    #ads
    ads_heads = Adsense.party.head.publish.sample(2) #header
    @ads_head = ads_heads[0] #header
    @ads_box = Adsense.party.box.publish.sample(2) #box
    @ads_lg = Adsense.party.box.publish.sample(1)[0] #lg
    @ads_bottom = ads_heads[1] #bottom
  end

  def after_party
		@head = "After Party"
    @url = "party"
    @party = Party.party.prev.publish.reverse_order.page(params[:page]).per(9)
    @first = Party.party.prev.publish.reverse_order.first
    @last = nil

    #ads
    ads_heads = Adsense.party.head.publish.sample(2) #header
    @ads_head = ads_heads[0] #header
    @ads_box = Adsense.party.box.publish.sample(2) #box
    @ads_lg = Adsense.party.box.publish.sample(1)[0] #lg
    @ads_bottom = ads_heads[1] #bottom
  end

  def show
	@head = "Party"
    @url = "party"
    @party = Party.party.find(params[:id])
    @title = @party.title
    @like_this = Party.party.publish.reverse_order.sample(8)

    impressionist(@party, "show page")

    #ads
    ads_heads = Adsense.party.head.publish.sample(2) #header
    @ads_head = ads_heads[0] #header
    @ads_box = Adsense.party.box.publish.sample(2) #box
    @ads_lg = Adsense.party.box.publish.sample(1)[0] #lg
    @ads_bottom = ads_heads[1] #bottom

    # raise ads_heads.inspect
  end
end
