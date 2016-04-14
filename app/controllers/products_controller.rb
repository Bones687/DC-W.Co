class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authorize, :except => [:show, :show_product, :list]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @product.photos.build
  end

  # GET /products/1/edit
  def edit
    #throw @product.photos
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    if params[:add_photo]
      @photos = @product.photos.build
      render :action => 'new'
    elsif params[:remove_photo]
      
    else
      respond_to do |format|
        if @product.save
          format.html { redirect_to @product, notice: 'Product was successfully created.' }
          format.json { render action: 'show', status: :created, location: @product }
        else
          format.html { render action: 'new' }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    if params[:add_photo]
      unless params[:product][:photos_attributes].blank?
        for attribute in params[:product][:photos_attributes]
          @product.photos.build(attribute.last.except(:_destroy)) unless attribute.last.has_key?(:id)
        end
      end
      @product.photos.build
      render :action => 'edit'
    elsif params[:remove_photo]
      removed_ingredients = params[:product][:photos_attributes].collect { |i, att| att[:id] if (att[:id] && att[:_destroy].to_i == 1) }
      Photo.delete(removed_ingredients)
      flash[:notice] = "Photos removed."
      for attribute in params[:product][:photos_attributes]
        @product.photos.build(attribute.last.except(:_destroy)) if (!attribute.last.has_key?(:id) && attribute.last[:_destroy].to_i == 0)
      end
      render :action => 'edit'
    else
      respond_to do |format|
        if @product.update(product_params)
          format.html { redirect_to @product, notice: 'Product was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def list
    @cateogry = Category.find_by_id(params[:id])
    @products = Product.where(category_id: params[:id])
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  def show_product
    @product = Product.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :quantity, :category_id, :description, photos_attributes:[:id, :link, :default])
    end
end
