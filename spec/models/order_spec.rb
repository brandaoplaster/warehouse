require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:total_price) }
    it { should validate_presence_of(:credit_card_number) }
    it { should validate_presence_of(:credit_card_name) }
    it { should validate_presence_of(:credit_card_cvv) }
    it { should validate_presence_of(:credit_card_expiration_month) }
    it { should validate_presence_of(:credit_card_expiration_year) }
    it { should validate_numericality_of(:total_price).is_greater_than(0) }
    it { should validate_length_of(:credit_card_number).is_at_least(13).is_at_most(19) }
    it { should validate_length_of(:credit_card_cvv).is_equal_to(3) }
    it { should validate_numericality_of(:credit_card_expiration_month).only_integer.is_in(1..12) }
    it { should validate_numericality_of(:credit_card_expiration_year).only_integer.is_greater_than_or_equal_to(Time.current.year) }
  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values(pending: 0, approved: 1, canceled: 2).with_default(:pending) }
  end
end
