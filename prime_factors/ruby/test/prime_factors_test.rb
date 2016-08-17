require 'minitest/autorun'
require_relative '../lib/prime_factors'

describe PrimeFactors do
  it 'calculates factors of 1' do
    PrimeFactors.generate(1).must_equal([])
  end

  it 'calculates factors of 2' do
    PrimeFactors.generate(2).must_equal([2])
  end

  it 'calculates factors of 3' do
    PrimeFactors.generate(3).must_equal([3])
  end

  it 'calculates factors of 4' do
    PrimeFactors.generate(4).must_equal([2, 2])
  end

  it 'calculates factors of 5' do
    PrimeFactors.generate(5).must_equal([5])
  end

  it 'calculates factors of 6' do
    PrimeFactors.generate(6).must_equal([2, 3])
  end

  it 'calculates factors of 7' do
    PrimeFactors.generate(7).must_equal([7])
  end

  it 'calculates factors of 8' do
    PrimeFactors.generate(8).must_equal([2, 2, 2])
  end

  it 'calculates factors of 9' do
    PrimeFactors.generate(9).must_equal([3, 3])
  end
end