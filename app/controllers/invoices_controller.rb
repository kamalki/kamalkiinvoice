class InvoicesController < ApplicationController
   before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    
    @invoices = Invoice.all
    #@invoices = Invoice.where(["customer LIKE ?","%#{params[:search]}%"])
    # @invoices = Invoice.search(params[:search])
  end
  def index1

    @invoices = Invoice.where("customer ILIKE ?","%#{params[:voice]}%")
    #@invoices = Invoice.where(["customer LIKE ?","%#{params[:search]}%"])
    # @invoices = Invoice.search(params[:search])
    render :partial => 'index1'
  end


  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @invoices = Invoice.all
  end
  
  def search
    @invoices = Invoice.search(params[:search])
  end

  # GET /invoices/new
  def new
  
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    # debugger
    byebug
    @invoice = Invoice.new(invoice_params)
    if @invoice.present?
    product1 = Product.find(params[:invoice][:product_ids]) 
    product1.quantity =  params["invoice"]["products"]["quantity"]
    if product1.present?
    @invoice.products << product1
    product = Product.new
    product.product_name =  params["invoice"]["product"]["product_name"]
    product.rate =  params["invoice"]["product"]["rate"]
    product.quantity = params["invoice"]["product"]["quantity"]
    if product.save
    @invoice.products << product 
    end      
    custom_product_price = params["invoice"]["product"]["total"].to_i rescue 0
    product_price = params["invoice"]["products"]["total"].to_i rescue 0
    @invoice.total =  custom_product_price  + product_price


    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  else
  # here mailer notification cn be send
  end
else
#here mailer notificatication
end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def populate_price
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:date, :invoice_number, :customer, :total, :phone_number,:email_id)
    end
end
