class ProductsController < ApplicationController

  def render_read
    @product = Product.where(:id => params[:id]).first
    #render :text => @product.
    render :partial =>  "render_read"
  end

  def new
  	@product = Product.new
  end

  def index
  	@products = Product.all
  end

  def create
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
