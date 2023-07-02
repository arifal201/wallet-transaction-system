class PricesController < ApplicationController
  before_action :logged_in

  def price
    price = Price.new.get_price
    response_json = JSON.parse(price)
    response_index(response_json, 'success get price')
  rescue StandardError
    response_error
  end

  def prices
    prices = Price.new.get_prices
    response_json = JSON.parse(prices)
    response_index(response_json, 'success get prices')
  rescue StandardError
    response_error
  end

  def price_all
    price_all = Price.new.get_price_all
    response_json = JSON.parse(price_all)
    response_index(response_json, 'success get price all')
  rescue StandardError
    response_error
  end
end
