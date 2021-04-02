require 'net/http'
require 'json'
require_relative 'bot'

class Jokes
  attr_reader :values

  def initialize
    @values = make_an_request
  end

  def make_an_request
    url = 'https://api.yomomma.info'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
