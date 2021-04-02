require 'telegram_bot'
require 'net/http'
require 'json'
require_relative 'bot'

class Motivation
  @values = nil

  def initialize
    @values = make_an_request
  end

  def make_an_request
    url = 'https://type.fit/api/quotes'
    uri = URI.parse(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def select_random
    @values = @values.sample
    @values
  end
end
