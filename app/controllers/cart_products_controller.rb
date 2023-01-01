class CartProductsController < ApplicationController
  def index
        @cart_products = CartProduct.all
    end

    def new
        @cart_product = CartProduct.new
    end

    def create
        @cart_product = CartProduct.create(cart_product_params)
        if @cart_product.save
          redirect_to cart_products_path
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
        @cart_product = CartProduct.find(params[:id])
    end

    def update
        @cart_product = CartProduct.find(params[:id])
        if @cart_product.update(cart_product_params)
          redirect_to cart_product_path(@cart_product)
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def show
        @cart_product = CartProduct.find(params[:id])
    end

    # def destroy

    # end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_products_path
  end


    private

    def cart_product_params
        params.require(:cart_product).permit(:products_count)
    end
end
