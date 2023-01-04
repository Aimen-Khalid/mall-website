class ProductsController < ApplicationController
  def index
        @store=Store.find(params[:store_id])
        @products = @store.products
    end

    def new
        @store=Store.find(params[:store_id])
        @product = @store.products.new
    end

    def create
        @store=Store.find(params[:store_id])
        @product = @store.products.create(product_params)
        if @product.save
          redirect_to store_products_path(@store)
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
      @store = Store.find(params[:store_id])
      @product = @store.products.find(params[:id])
      
    end

    def update
        @store = Store.find(params[:store_id])
        @product = @store.products.find(params[:id])

        if @product.update(product_params)
          redirect_to store_product_path(@store, @product), notice: 'Product was successfully updated.'
        else
          render :edit
        end
    end

    def show
        @store=Store.find(params[:store_id])
        @product = @store.products.find(params[:id])
    end

    def add_to_cart
        product=Product.find(params[:id])
        cart=current_user.cart
        CartProduct.new(cart_id: cart.id, product_id:product.id).save
        current_user.cart.products_count+=1
        redirect_to user_cart_path(current_user,cart)
    end

    def remove_from_cart
      product=Product.find(params[:id])
      cart=current_user.cart
      CartProduct.where(cart_id: cart.id, product_id: product.id).first.destroy
      current_user.cart.products_count-=1
      redirect_to user_cart_path(current_user,cart)
  end

    # def destroy

    # end

  def destroy
    @store=Store.find(params[:store_id])
    @product = @store.products.find(params[:id])
    @product.destroy
    redirect_to store_products_path(@store)
  end


    private

    def product_params
        params.require(:product).permit(:product_name,
        :product_description, :category, :price, :order_date, :image)
    end
end
