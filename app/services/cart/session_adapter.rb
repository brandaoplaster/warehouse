module Cart
  class SessionAdapter
    def initialize(session)
      @session = session
    end

    def add_item(product_id, quantity)
      @session[:cart][product_id.to_s] = quantity
    end

    def remove_item(product_id)
      @session[:cart].delete(product_id.to_s)
    end

    def update_quantity(product_id, quantity)
      @session[:cart][product_id.to_s] = quantity
    end

    def items
      product_ids = @session[:cart].keys
      products = Product.where(id: product_ids)

      products.map do |product|
        OpenStruct.new(
          product: product,
          quantity: @session[:cart][product.id.to_s],
          id: product.id
        )
      end
    end

    def total
      items.sum { |item| item.product.price * item.quantity }
    end

    def clear
      @session[:cart] = {}
    end
  end
end
