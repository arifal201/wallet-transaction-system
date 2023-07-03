class PricesController < ApplicationController
  before_action :logged_in
  before_action :set_price, only: [:price, :autocomplete_price]
  before_action :set_prices, only: :prices
  before_action :set_price_all, only: :price_all

  def price
    response_index(@price, 'success get price')
  rescue StandardError
    response_error
  end

  def prices
    response_index(@prices, 'success get prices')
  rescue StandardError
    response_error
  end

  def price_all
    response_index(@price_all, 'success get price all')
  rescue StandardError
    response_error
  end

  def autocomplete_price
    response_success(@price, 'success autocomplete')
  end

  private

  def set_price
    @price = JSON.parse(Price.new.get_price)
  rescue StandardError
    response_error
  end

  def set_prices
    @prices = JSON.parse(Price.new.get_prices)
  rescue StandardError
    response_error
  end

  def set_price_all
    @price_all = JSON.parse(Price.new.get_price_all)
  rescue StandardError
    response_error
  end
end
