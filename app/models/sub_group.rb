class SubGroup < ApplicationRecord
  belongs_to :activity
  has_many :schedules, dependent: :destroy
  attribute :tarifications, array: true

  def min_price
    min_price_cents / 100.0
  end

  def max_price
    max_price_cents / 100.0
  end

  def subscription_by_reccurence_price
    subscription_by_reccurence_price_cents / 100.0
  end

  def min_price=(value)
    self.min_price_cents = (value.to_f * 100).round
  end

  # def max_price=(value)
  #   self.max_price_cents = (value.to_f * 100).round
  # end

  def subscription_by_reccurence_price=(value)
    self.subscription_by_reccurence_price_cents = (value.to_f * 100).round
  end
end
