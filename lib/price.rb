require 'uri'
require 'net/http'

class Price
  # def initialize(indicate, api_key, api_host)
  #   @indicate = indicate
  #   @apikey = api_key
  #   @apihost = api_host
  # end

  def get_price
    url = URI("https://latest-stock-price.p.rapidapi.com/price?Indices=NIFTY%2050")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = "#{ENV['RAPID_API_KEY']}"
    request["X-RapidAPI-Host"] = "#{ENV['RAPID_API_HOST']}"

    response = http.request(request)
    @body = response.read_body
  end

  def get_prices
    url = URI("https://latest-stock-price.p.rapidapi.com/price?Indices=NIFTY%2050")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = "#{ENV['RAPID_API_KEY']}"
    request["X-RapidAPI-Host"] = "#{ENV['RAPID_API_HOST']}"

    response = http.request(request)
    @body = response.read_body
  end

  def get_price_all
    url = URI("https://latest-stock-price.p.rapidapi.com/any")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = "#{ENV['RAPID_API_KEY']}"
    request["X-RapidAPI-Host"] = "#{ENV['RAPID_API_HOST']}"

    response = http.request(request)
    @body = response.read_body
  end
end