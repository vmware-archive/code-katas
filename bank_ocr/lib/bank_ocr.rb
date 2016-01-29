class BankOcr
  def initialize(text)
    @text = text
  end

  def account_number
    @lines = @text.split("\n")
    @characters = @lines.map(&:chars)
    @grouped = @characters.map { |c| c.each_slice(3).to_a }.transpose.map { |num| num[0..-2].flatten }
    @numbers = @grouped.map do |num|
      case num
        when zero
          '0'
        when one
          '1'
        when two
          '2'
        when three
          '3'
        when four
          '4'
        when five
          '5'
        when six
          '6'
        when seven
          '7'
        when eight
          '8'
        when nine
          '9'
        else
          '?'
      end
    end

    @illegal = false
    @error = false

    if @numbers.include?('?')
      @illegal = true
    else
      @checksum = @numbers.reverse.each_with_index.reduce(0) { |acc, (num, idx)| acc + (idx + 1) * num.to_i } % 11
      if @checksum != 0
        @error = true
      end
    end

    if @illegal || @error
      @differences = {}
      @grouped.each_with_index do |group, i|
        all.each_with_index  do |num, j|
          if (0..9).map { |k| group[k] == num[k] ? nil : true }.compact.length == 1
            @differences[i] ||= []
            @differences[i] << j
          end
        end
      end

      if @differences.empty?
        @numbers.join + ' ILL'
      else
        @valid = []
        @differences.each do |i, arr|
          arr.each do |new|
            @try = @numbers.dup
            @try.delete_at(i)
            @try.insert(i, new.to_s)
            if @try.include?('?')
              next
            else
              @checksum = @try.reverse.each_with_index.reduce(0) { |acc, (num, idx)| acc + (idx + 1) * num.to_i } % 11
              if @checksum == 0
                @valid << @try
              end
            end
          end
        end
        if @valid.length == 0
          @numbers.join + ' ILL'
        elsif @valid.length == 1
          @valid.first.join
        else
          @numbers.join + ' AMB ' + @valid.map(&:join).to_s
        end
      end
    else
      @numbers.join
    end
  end

  private

  def all
    [zero, one, two, three, four, five, six, seven, eight, nine]
  end

  def nine
    (' _ '+
     '|_|'+
     ' _|').chars
  end

  def eight
    (' _ '+
     '|_|'+
     '|_|').chars
  end

  def seven
    (' _ '+
     '  |'+
     '  |').chars
  end

  def six
    (' _ '+
     '|_ '+
     '|_|').chars
  end

  def five
    (' _ '+
     '|_ '+
     ' _|').chars
  end

  def four
    ('   '+
     '|_|'+
     '  |').chars
  end

  def three
    (' _ '+
     ' _|'+
     ' _|').chars
  end

  def two
    (' _ '+
     ' _|'+
     '|_ ').chars
  end

  def one
    ('   '+
     '  |'+
     '  |').chars
  end

  def zero
    (' _ '+
     '| |'+
     '|_|').chars
  end
end