require_relative '../lib/motivation'
describe Motivation do
  let(:quote_of_the_day){Motivation.new}

  describe '#initialize' do
    let(:value) {quote_of_the_day.value}

    it 'returns true when object passwed to array' do
      expect(value.is_a?(Array)).to be(true)
    end
  end
end
