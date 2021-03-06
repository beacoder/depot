class LineItemsController < ApplicationController

  # [112] update: skip user authorization check only for method: create
  skip_before_action :authorize, only: :create

  # [23] update: include the CurrentCart module
  # declare set_cart() to be called before the create() action.
  include CurrentCart
  before_action :set_cart, only: [:create]

  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    # [24] update: find product with :product_id from request and add into cart
    product = Product.find(params[:product_id])
    # @line_item = @cart.line_items.build(product: product)

    # [29] update: add product to cart and update quantity
    @line_item = @cart.add_product(product)

    respond_to do |format|
      if @line_item.save
        # [25] update: redirect users to the cart
        # format.html { redirect_to @line_item.cart, notice: 'Line item was successfully created.' }

        # [38] update: remove flash message specified by :notice
        # format.html { redirect_to @line_item.cart}

        # [51] update: redirect to the index page with cart shown in the sidebar
        format.html { redirect_to store_index_url }

        # [56] update: respond to Ajax request with JavaScript
        # format.js

        # [58] update: keep track of most recent updated item in the cart with @current_item
        format.js { @current_item = @line_item }

        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      # [35] update: remove cart_id from the list of parameters that are permitted
      params.require(:line_item).permit(:product_id)
      # params.require(:line_item).permit(:product_id, :cart_id)
    end
end
