# == Schema Information
#
# Table name: sub_groups
#
#  id                                     :bigint           not null, primary key
#  activity_id                            :bigint           not null
#  name                                   :string
#  min_price_cents                        :integer
#  max_price_cents                        :integer
#  recurrence                             :string
#  class_type                             :string
#  short_description                      :text
#  subscription_by_recurrence_price_cents :integer
#  created_at                             :datetime         not null
#  updated_at                             :datetime         not null
#  tarifications                          :text             default([]), is an Array
#
class SubGroup < ApplicationRecord
  belongs_to :activity
  has_many :schedules, dependent: :destroy
  attribute :tarifications, array: true
  has_many :tarifications, dependent: :destroy
  accepts_nested_attributes_for :tarifications, allow_destroy: true

  def min_price
    min_price_cents / 100.0
  end

  def max_price
    max_price_cents / 100.0
  end

  def subscription_by_recurrence_price
    subscription_by_recurrence_price_cents / 100.0
  end

  def min_price=(value)
    self.min_price_cents = (value.to_f * 100).round
  end

  # def max_price=(value)
  #   self.max_price_cents = (value.to_f * 100).round
  # end

  def subscription_by_recurrence_price=(value)
    self.subscription_by_recurrence_price_cents = (value.to_f * 100).round
  end
end
