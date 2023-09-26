# frozen_string_literal: true

class Fare
  attr_reader :name, :price, :currency

  def initialize(name:, price:, currency:)
    @name = name
    @price = price.to_f
    @currency = currency
  end

  def to_s
    "#{name}: #{price_to_s} #{currency}"
  end

  private

  def price_to_s
    format('%.2f', price)
  end
end
