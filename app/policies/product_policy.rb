class ProductPolicy
    attr_reader :user, :product
  
    def initialize( user, product)
      @user = user
      @product = product
    end
  
    def edit?
      user.Seller?
    end
    
    def create?
      user.Seller? 
    end
    
    def new?
      user.Seller? 
    end

    def update?
        user.Seller?
      end

    def destroy?
      user.Seller? 
    end

    

  end