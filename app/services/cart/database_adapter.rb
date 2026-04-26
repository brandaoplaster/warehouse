module Cart
  class DatabaseCartAdapter
    def initialize(user)
      @user = user
    end

    def add_item(product_id, quantity)
      cart = find_or_create_cart
      cart_item = cart.cart_items.find_or_initialize_by(product_id: product_id)
      cart_item.quantity = quantity
      cart_item.save
    end

    def remove_item(cart_item_id)
      cart.cart_items.find(cart_item_id).destroy
    end

    def update_quantity(cart_item_id, quantity)
      cart_item = cart.cart_items.find(cart_item_id)
      cart_item.update(quantity: quantity)
    end

    def items
      cart.cart_items.includes(:product)
    end

    def total
      cart.cart_items.joins(:product).sum("products.price * cart_items.quantity")
    end

    def clear
      cart.cart_items.destroy_all
    end

    private

    def cart
      @cart ||= find_or_create_cart
    end

    def find_or_create_cart
      @user.cart || @user.create_cart
    end
  end
end
