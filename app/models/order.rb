class Order < ApplicationRecord
  belongs_to :user

  validates :total_price, presence: true, numericality: { greater_than: 0 }
  validates :credit_card_number, presence: true, length: { minimum: 13, maximum: 19 }
  validates :credit_card_name, presence: true
  validates :credit_card_cvv, presence: true, length: { is: 3 }
  validates :credit_card_expiration_month, presence: true, numericality: { only_integer: true, in: 1..12 }
  validates :credit_card_expiration_year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: Time.current.year }

  enum :status, { pending: 0, approved: 1, canceled: 2 }, default: :pending

  validate :card_not_expired

  private

  def card_not_expired
    return if credit_card_expiration_year.blank? || credit_card_expiration_month.blank?
    expiration_date = Date.new(credit_card_expiration_year, credit_card_expiration_month, -1)
    errors.add(:base, "Credit card is expired") if expiration_date< Date.current
  rescue Date::Error, ArgumentError
    nil
  end
end
