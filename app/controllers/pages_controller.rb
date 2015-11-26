class PagesController < ApplicationController
  def home
  end

  def inventory
    products = Product.all
    headers['Access-Control-Allow-Origin'] = '*'
    puts products
    render json: products.to_json
  end

# Use url.../on_hand?sku=productSKU to get the available numbe of this product
  def on_hand_left
    product = Product.find_by(sku: params[:sku])
    if product
      data = {count: product.on_hand}
    else
      data = {count: 0}
    end

    headers['Access-Control-Allow-Origin'] = '*'
    puts data
    render json: data.to_json
  end

  def create
    product = Product.find_by(sku: params[:sku])
    if product
      product.update on_hand: product.on_hand-1
    else
      redirect_to root_url, notice: "The product is not available now"
    end
    head :created
  end

end
