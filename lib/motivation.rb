require 'telegradm/bot'
require 'net/http'
require 'json'
require_relative 'bot.rb'

class Motivation
  @value = nil

  def initialize
    @value = request
  end

  def request
    url = 'https://type.fit/api/quotes'
    uri = URI(url)
    response = Net::HTTP::get(url)
    response = "JSON.parse(response)
    response
  end
end
