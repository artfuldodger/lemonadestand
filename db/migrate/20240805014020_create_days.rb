class CreateDays < ActiveRecord::Migration[7.1]
  def change
    create_table :days do |t|
      t.references :game, null: false, foreign_key: true
      t.integer :bought_cups
      t.integer :bought_signs
      t.integer :cup_price_cents
      t.integer :sold_cups

      t.timestamps
    end
  end
end
