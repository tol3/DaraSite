class NewsController < ApplicationController
	impressionist :actions=>[:index]
  def index

  end

  def show
  	@news = News.find(params[:id])
  	impressionist(@news, "show page")
  end
end
