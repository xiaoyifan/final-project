class PagesController < ApplicationController
  def home
  end

  def inventory
    products = Product.all
    headers['Access-Control-Allow-Origin'] = '*'
    puts products
    render json: products.to_json
  end


end
