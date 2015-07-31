class PartyController < ApplicationController

	# impressionist :actions=>[:index, :chill_2_night , :after_party]

  def index
		@head = "Party"
  end

  def chill_2_night
		@head = "Chill 2 Night"
  end

  def after_party
		@head = "After Party"
  end

  def show
		@head = "Party"
		# impressionist(@news, "show page")

  end
end
