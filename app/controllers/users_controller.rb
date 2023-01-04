
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:index]

def index
    @users = User.all
    @user=current_user
    
  end

  def new
      @user = User.new
  end

  def create
      @user = User.create(user_params)
      if @user.save
        @user.cart=Cart.new(products_count:0)
        redirect_to users_path
      else
        render :new, status: :unprocessable_entity
      end
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def show    
    @user = User.find(params[:id])

    # if user_signed_in?
    #   @user = current_user
    # else
    #   redirect_to '/users/sign_in'
    # end
  end

  
  

  # def destroy

  # end

def destroy
  @user = User.find(params[:id])
  @user.destroy
  redirect_to users_path
end


  private
  private
    def set_user
      @user = User.find(params[:id])
    end

    def check_admin
      unless current_user.user_type == "Admin"
        redirect_to root_path, alert: "You are not authorized to access this page."
      end
    end
  def user_params
      params.require(:user).permit(:name, :email, :address, :phone_number, :user_type, :password)
  end
end
