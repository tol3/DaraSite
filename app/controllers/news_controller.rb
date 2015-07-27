class NewsController < ApplicationController
  def index
  	raise Visit.first.inspect
  end

  def show
  end
end
