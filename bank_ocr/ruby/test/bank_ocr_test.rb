require 'minitest/autorun'
require_relative '../lib/bank_ocr'

describe BankOcr do
  describe 'parsing tests' do
    it 'parses an account number' do
      num = "    _  _     _  _  _  _  _ \n" +
            "  | _| _||_||_ |_   ||_||_|\n" +
            "  ||_  _|  | _||_|  ||_| _|\n"
      BankOcr.new(num).account_number.must_equal('123456789')
    end
  end

  describe 'status tests' do
    it 'parses when the account has one valid alternative' do
      num = " _     _  _  _  _  _  _  _ \n" +
            " _||_||_ |_||_| _||_||_ |_ \n" +
            " _   | _||_||_||_ |_||_| _|\n"
      BankOcr.new(num).account_number.must_equal('345882865')
    end

    it 'appends illegal status if no alternatives' do
      num = "                           \n"+
            "|_||_||_||_||_||_||_||_||_|\n"+
            "  |  |  |  |  |  |  |  |  |\n"
      BankOcr.new(num).account_number.must_equal('444444444 ILL')
    end

    it 'appends illegal status if account is not parsable' do
      num = " _  _  _     _  _  _  _  _ \n" +
            " _  _| _||_||_ |_   ||_||_|\n" +
            " _ |_  _|  | _||_|  ||_| _|\n"
      BankOcr.new(num).account_number.must_equal('?23456789 ILL')
    end

    it 'appends ambiguity status if account has multiple interpretations' do
      num = "    _  _  _  _  _  _     _ \n"+
            "|_||_|| || ||_   |  |  ||_ \n"+
            "  | _||_||_||_|  |  |  | _|\n"
      account_number = BankOcr.new(num).account_number
      account_number.must_match (/^490067715 AMB/)
      account_number.must_match ('490067115')
      account_number.must_match ('490067719')
      account_number.must_match ('490867715')
    end
  end
end