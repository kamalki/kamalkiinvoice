class ProductsController < ApplicationController

  def render_read
    @product_id = params[:id]
    if @product_id.present?
    @product = Product.where(:id => @product_id).first
     if @product.present?
     @product_rate = @product.rate
      end
    end
  end

  def new
    byebug
  	@product = Product.new
  end

  def index
  	@products = Product.all
  end

  def create
    byebug
    @product=Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Invoice was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
  	@productss = Product.all
  end

  private
  def product_params
      params.require(:product).permit(:product_name, :rate)
  end

end
