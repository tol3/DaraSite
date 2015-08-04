class PartyController < ApplicationController

	impressionist :actions=>[:index, :chill_2_night , :after_party]

  def index
		@head = "Party Calendar"
    @url = "party"
    @party = Party.party.publish.reverse_order.page(params[:page]).per(9)
    @first = Party.party.publish.reverse_order.first
    @last = Party.party.prev.publish.reverse_order.page(params[:page]).per(6)
  end

  def chill_2_night
		@head = "Chill 2 Night"
    @url = "party"
    @party = Party.party.prev.publish.reverse_order.page(params[:page]).per(9)
    @first = Party.party.publish.reverse_order.first
    @last = Party.party.prev.publish.reverse_order.page(params[:page]).per(6)
  end

  def after_party
		@head = "After Party"
    @url = "party"
    @party = Party.party.prev.publish.reverse_order.page(params[:page]).per(9)
    @first = Party.party.prev.publish.reverse_order.first
    @last = nil
  end

  def show
		@head = "Party"
    @url = "party"
    @party = Party.party.find(params[:id])
    @title = @party.title
    @like_this = Party.party.publish.reverse_order.sample(8)

    impressionist(@party, "show page")
  end
end
