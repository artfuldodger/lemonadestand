class Game < ApplicationRecord
  belongs_to :user
  has_many :days

  before_create :set_current_money

  private

  def set_current_money
    self.current_money ||= 10_000
  end
end
