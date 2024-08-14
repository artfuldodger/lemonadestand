class Day < ApplicationRecord
  belongs_to :game

  def cup_price
    return nil unless cup_price_cents

    cup_price_cents / 100.0
  end

  def cup_price=(new_cup_price)
    self.cup_price_cents = new_cup_price.to_f * 100
  end

  def money_spent
    bought_cups * 100 + bought_signs * 500
  end

  def money_earned
    sold_cups * cup_price_cents
  end

  def profit
    money_earned - money_spent
  end

  def profitable?
    profit >= 0
  end
end
