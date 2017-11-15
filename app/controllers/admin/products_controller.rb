class Admin::ProductsController < ApplicationController
  http_basic_authenticate_with :name => ENV["username"], :password => ENV["password"]  
  def index
    @products = Product.order(id: :desc).all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to [:admin, :products]
    else
      render :new
    end
  end

  def destroy
    @product = Product.find params[:id]
    @product.destroy
    flash[:success] = "Product deleted."
    redirect_to [:admin, :products]
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price
    )
  end

end
