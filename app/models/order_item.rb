class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :unit_price, presence: true, numericality: { greater_than: 0 }
  validates :product_id, uniqueness: { scope: :order_id, message: "has already been added to this order" }

  def total_price
    quantity * unit_price
  end
end
