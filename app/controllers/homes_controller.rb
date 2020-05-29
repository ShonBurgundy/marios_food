class HomesController < ApplicationController
  def index
    @products = Product.all
    @products_newest = Product.recently_added
    @products_most = Product.most_reviews
    render :index
  end
end