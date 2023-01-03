
class UsersController < ApplicationController

def index
      @users = User.all
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

  def user_params
      params.require(:user).permit(:name, :email, :address, :phone_number, :user_type, :password)
  end
end
