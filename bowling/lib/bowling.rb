class Bowling
  def initialize
    @rolls = []
  end

  def score
    score = 0
    idx = 0
    (0...10).each do
      if @rolls[idx].to_i == 10
        score += 10 + @rolls[idx + 1].to_i + @rolls[idx + 2].to_i
        idx += 1
      elsif @rolls[idx].to_i + @rolls[idx + 1].to_i == 10
        score += 10 + @rolls[idx + 2].to_i
        idx += 2
      else
        score += @rolls[idx].to_i + @rolls[idx + 1].to_i
        idx += 2
      end
    end
    score
  end

  def roll(pins)
    @rolls << pins
  end
end