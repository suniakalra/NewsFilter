class HomeController < ApplicationController

  def index
    @categories = Category.all
  end

  def category_news
    @categories = Category.all

    category_id = params[:id].nil? ? Category.first.id : params[:id]

    @category = Category.find(category_id)
    @news = @category.news

  end

end
