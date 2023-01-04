class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:edit, :create, :update, :destroy, :new]
  def index
          @stores = Store.all
          

    end

    def new
        @store = Store.new
        @user = current_user
    end

    def create
        @store = Store.create(store_params)
        @user = current_user
        if @store.save
          redirect_to stores_path
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
        @store = Store.find(params[:id])
        @user = current_user
    end

    def update
        @store = Store.find(params[:id])
        @user = current_user
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
    @store.destroy
    redirect_to stores_path
  end


    private
    def set_store
      @store = Store.find(params[:id])
    end

    def check_admin
      unless current_user.user_type == "Admin"
        redirect_to root_path, alert: "You are not authorized to access this page."
      end
    end
    def store_params
        params.require(:store).permit(:store_name, :description, :address, :phone_number, :mail, :logo)
    end
end
