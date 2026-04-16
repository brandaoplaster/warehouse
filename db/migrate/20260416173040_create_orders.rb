class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :total_price, precision: 10, scale: 2, null: false
      t.integer :status, null: false, default: 0
      t.string :credit_card_number, null: false
      t.string :credit_card_name, null: false
      t.string :credit_card_cvv, null: false
      t.integer :credit_card_expiration_month, null: false
      t.integer :credit_card_expiration_year, null: false

      t.timestamps
    end

    add_index :orders, :status
  end
end
