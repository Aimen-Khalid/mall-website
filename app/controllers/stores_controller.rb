class StoresController < ApplicationController
  def index
          @stores = Store.all
          

    end

    def new
        @store = Store.new
        @user = current_user
        authorize @store
    end

    def create
        @store = Store.create(store_params)
        @user = current_user
        authorize @store
        if @store.save
          redirect_to stores_path
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
        @store = Store.find(params[:id])
        @user = current_user
        authorize @store
    end

    def update
        @store = Store.find(params[:id])
        @user = current_user
        authorize @store
        if @store.update(store_params)
          redirect_to store_path(@store)
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def show
        @store = Store.find(params[:id])
    end

   

  def destroy
    @store = Store.find(params[:id])
    @user = current_user
    authorize @store
    @store.destroy
    redirect_to stores_path
  end


    private

    def store_params
        params.require(:store).permit(:store_name, :description, :address, :phone_number, :mail, :logo)
    end
end
