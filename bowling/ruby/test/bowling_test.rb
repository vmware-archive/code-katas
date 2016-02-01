require 'minitest/autorun'
require_relative '../lib/bowling'

describe Bowling do
  it 'correctly calculates an all-zeros game' do
    game = Bowling.new

    9.times do
      game.roll(0)
      game.roll(0)
    end

    game.roll(0)
    game.roll(0)
    game.score.must_equal(0)
  end

  it 'correctly calculates an all-ones game' do
    game = Bowling.new

    9.times do
      game.roll(1)
      game.roll(1)
    end

    game.roll(1)
    game.roll(1)
    game.score.must_equal(20)
  end

  it 'correctly calculates one spare' do
    game = Bowling.new
    game.roll(3)
    game.roll(7)
    game.roll(6)
    game.score.must_equal((3 + 7 + 6) + (6))
  end

  it 'correctly calculates one strike' do
    game = Bowling.new
    game.roll(10)
    game.roll(7)
    game.roll(1)
    game.score.must_equal((10 + 7 + 1) + (7 + 1))
  end

  it 'correctly calculates a perfect game' do
    game = Bowling.new

    9.times do
      game.roll(10)
    end

    game.roll(10)
    game.roll(10)
    game.roll(10)
    game.score.must_equal(300)
  end

  it 'correctly calculates a game of spares' do
    game = Bowling.new

    9.times do
      game.roll(6)
      game.roll(4)
    end

    game.roll(6)
    game.roll(4)
    game.roll(6)
    game.score.must_equal(160)
  end
end