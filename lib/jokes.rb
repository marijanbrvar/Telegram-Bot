require 'net/http'
require 'json'
require_relative 'bot'

class Jokes
  attr_reader :values

  def initialize
    @values = make_an_request
  end

  def make_an_request
    url = 'https://v2.jokeapi.dev/joke/Any?blacklistFlags=sexist&type=single'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
