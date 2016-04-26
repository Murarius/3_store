# class ProductsController < ApplicationController
class ProductsController < ApplicationController
  expose(:product, attributes: :product_params)
  expose(:products)

  # GET /products
  # GET /products.json
  def index
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    respond_to do |format|
      if product.save
        format.html { redirect_to product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: product }
      else
        format.html { render :new }
        format.json { render json: product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if product.update(product_params)
        format.html { redirect_to product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: product }
      else
        format.html { render :edit }
        format.json { render json: product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description)
  end
end
