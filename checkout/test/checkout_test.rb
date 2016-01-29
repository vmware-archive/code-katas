require 'minitest/autorun'
require_relative '../lib/checkout'

describe Checkout do
  RULES = {
      'A' => [50, [3, 130]],
      'B' => [30, [2, 45]],
      'C' => [20],
      'D' => [15]
  }

  def price_of(goods)
    checkout = Checkout.new(RULES)
    goods.split(//).each { |item| checkout.scan(item) }
    checkout.total
  end

  it 'calculates totals correctly' do
    price_of('').must_equal(0)
    price_of('A').must_equal(50)
    price_of('AB').must_equal(80)
    price_of('CDBA').must_equal(115)

    price_of('AA').must_equal(100)
    price_of('AAA').must_equal(130)
    price_of('AAAA').must_equal(180)
    price_of('AAAAA').must_equal(230)
    price_of('AAAAAA').must_equal(260)

    price_of('AAAB').must_equal(160)
    price_of('AAABB').must_equal(175)
    price_of('AAABBD').must_equal(190)
    price_of('DABABA').must_equal(190)
  end

  it 'calculates totals incrementally' do
    co = Checkout.new(RULES)
    co.total.must_equal(0)
    co.scan('A'); co.total.must_equal(50)
    co.scan('B'); co.total.must_equal(80)
    co.scan('A'); co.total.must_equal(130)
    co.scan('A'); co.total.must_equal(160)
    co.scan('B'); co.total.must_equal(175)
  end
end