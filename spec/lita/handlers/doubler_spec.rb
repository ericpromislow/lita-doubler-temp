require "spec_helper"

describe Lita::Handlers::Doubler, lita_handler: true do
  describe 'routing' do

    it { is_expected.to route("Lita double 2") }
    it { is_expected.to route("Lita double   2") }
    it { is_expected.to route("Lita doUbLe   2") }
    it { is_expected.to_not route("Lita doUbLe two") }
    it { is_expected.to_not route("Lita doUbLe 1.2") }
    it { is_expected.to_not route("Lita doUbLe 1e5") }
  end

  describe ':double_number' do
    let(:n) { rand(1..100) }

    it 'doubles the input' do
      actual = subject.double_number n
      expected = n * 2
      expect(actual).to eq(expected)
    end

    it 'doubles up' do
      send_message 'Lita double 2'

      expect(replies.last).to eq('2 + 2 = 4')
    end
  end
end
