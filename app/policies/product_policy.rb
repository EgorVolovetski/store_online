class ProductPolicy
  attr_reader :user, :product

  def initialize(user, product)
    @user = user
    @product = product
  end

  def index?
    user.customer? || user.manufacturer?
  end

  def show?
    user.customer? || user.manufacturer?
  end

  def create?
    user.manufacturer?
  end

  def update?
    user.manufacturer?
  end

  def destroy?
    user.manufacturer?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.manufacturer?
        scope.all
      else
        scope.all
      end
    end
  end
end