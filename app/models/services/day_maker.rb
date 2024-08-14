module Services
  class DayMaker
    def initialize(day)
      self.day = day
    end

    def make
      return false unless sufficient_funds?

      day.sold_cups = cups_sold
      day.save! && day.game.update!(current_money: new_current_money)
    end

    private

    attr_accessor :day

    def new_current_money
      day.game.current_money + day.profit
    end

    def sufficient_funds?
      if day.game.current_money < day.money_spent
        day.errors.add(:base, "You don't have $#{(cost_of_day / 100).round(2)} :(")
        return false
      end
      true
    end

    def cups_sold
      @cups_sold ||= begin
        cups_sold = 0

        base_chance = 50
        base_chance += day.bought_signs * 5
        base_chance += (2 - day.cup_price)

        day.bought_cups.times do
          cups_sold += 1 if rand(base_chance) > 40
        end

        cups_sold
      end
    end
  end
end
