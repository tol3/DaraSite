class DaraController < ApplicationController
  def index
  end

  def contact
  end

  def about
  end

  def search
  	News.reindex
  	Party.reindex
  	if params[:search]
  		@search = params[:search]
  		@news = News.search @search, operator: "or", where: {publish: true}, page: params[:page], per_page: 20
  		@party = Party.search @search, operator: "or", where: {publish: true}, page: params[:page], per_page: 20
  	else
  		@search = ""
			@news = News.where(publish: true)
  		@party = Party.where(publish: true)
  	end

  end
end
