class StorePolicy
    attr_reader :user, :store
  
    def initialize( user, store)
      @user = user
      @store = store
    end
  
    def edit?
      user.Admin? || user.Seller?
    end
    
    def create?
      user.Admin? 
    end
    
    def new?
      user.Admin? 
    end

    def update?
        user.Admin? || user.Seller?
      end

    def destroy?
      user.Admin? 
    end

    

  end