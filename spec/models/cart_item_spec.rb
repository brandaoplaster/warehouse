require 'rails_helper'

RSpec.describe CartItem, type: :model do
  describe 'associations' do
    it { should belong_to(:cart) }
    it { should belong_to(:product) }
  end

  describe 'validations' do
    subject { build(:cart_item) }

    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:unit_price) }
    it { should validate_numericality_of(:quantity).only_integer.is_greater_than(0) }
    it { should validate_numericality_of(:unit_price).is_greater_than(0) }
    it { should validate_uniqueness_of(:product_id).scoped_to(:cart_id).with_message("has already been added to this cart") }
  end
end
