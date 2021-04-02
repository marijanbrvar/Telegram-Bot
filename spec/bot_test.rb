require_relative '../lib/motivation'
require_relative '../lib/jokes'

describe Motivation do
  let(:quote) { Motivation.new }

  describe '#select_random' do
    context 'selecting randomly' do
      it 'returns a key and a value' do
        expect(quote.select_random.length).to eql(2)
      end
    end

    it 'Returns false for a hash width key/value pairs' do
      expect(quote.select_random.length).to_not eql(1)
    end
  end

  describe '#make_an_request' do
    let(:request) { Motivation.new }

    it 'returns a JSON' do
      expect(request.make_an_request.class).to be(Array)
    end

    it 'Must not return empty array' do
      expect(request.make_an_request.length).to_not eql(0)
    end
  end
end

describe Jokes do
  describe '#make_an_request' do
    let(:joke) { Jokes.new }
    let(:request_joke) { joke.make_an_request }

    it 'should not return an empty array' do
      expect(request_joke.length).to_not eql(0)
    end

    it 'should return a hash if the request is right' do
      expect(request_joke.class).to eql(Hash)
    end
  end
end
