class Day < ApplicationRecord
  belongs_to :game

  def cup_price
    return nil unless cup_price_cents

    cup_price_cents / 100.0
  end

  def cup_price=(new_cup_price)
    self.cup_price_cents = new_cup_price.to_f * 100
  end
end
