class CartsController < ApplicationController
  def index
        @user = User.find(params[:user_id])
        @cart = @user.cart
    end

    def new
      @user= User.find(params[:user_id])
      @cart = @user.cart.new
    end

    def create
        @cart = Cart.create(cart_params)
        if @cart.save
          redirect_to carts_path
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit

        @user = User.find(params[:user_id])
        @cart = @user.cart
        @products=@cart.products
    end

    def update
        @cart = Cart.find(params[:id])
        if @cart.update(cart_params)
          redirect_to cart_path(@cart)
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def show
      @cart = current_user.cart
      @products=@cart.products
    end

    def checkout
      @cart = current_user.cart
      @cart.products.clear
      @cart.products_count=0
    end

    

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to carts_path
  end

  

    private

    def cart_params
        params.require(:cart).permit(:products_count)
    end
end
