class Checkout
  def initialize(rules)
    @rules = rules
    @items = []
  end

  def scan(item)
    @items << item
  end

  def total
    @grouped = @items.reduce(Hash.new(0)) do |hash, item|
      hash[item] += 1
      hash
    end

    @grouped.reduce(0) do |total, (item, quantity)|
      rule = @rules[item]
      price, discount = rule
      if discount
        dquantity, dprice = discount
        total += dprice * (quantity / dquantity).floor
        quantity = quantity % dquantity
      end
      total + price * quantity
    end
  end
end