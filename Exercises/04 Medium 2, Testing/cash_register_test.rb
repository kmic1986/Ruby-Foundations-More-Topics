require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(500)
  end

  def test_register_exists
    assert(@register)
  end

  def test_total_money
    assert_equal(500, @register.total_money)
  end

  def test_accept_money
    trans = Transaction.new(50)
    trans.amount_paid = 50
    @register.accept_money(trans)
    assert_equal(550, @register.total_money)
  end

  def test_change
    trans = Transaction.new(47)
    trans.amount_paid = 50
    assert_equal(3, @register.change(trans))
  end

  def test_give_receipt
    trans = Transaction.new(50)
    trans.amount_paid = 50
    assert_output("You've paid $50.\n") do
      @register.give_receipt(trans)
    end
  end

  def test_prompt_for_payment
    trans = Transaction.new(30)
    input = StringIO.new('30')
    output = StringIO.new
    trans.prompt_for_payment(input: input, output: output)
    assert_equal(30, trans.amount_paid)
  end
end
