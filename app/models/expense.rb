# frozen_string_literal: true

class Expense < ApplicationRecord
  validates :name, presence: true
  validates :value, presence: true, numericality: true

  belongs_to :user

  enum category: {
    traveling: 'Traveling',
    clothing: 'Clothing',
    taxi: 'Taxi',
    cafes: 'Cafes',
    shops: 'Shops',
    other: 'Other'
  }
end
