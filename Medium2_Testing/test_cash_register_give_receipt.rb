require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def test_accept_money
    total_money = 0
    cash_register = CashRegister.new(total_money)

    transaction = Transaction.new(100)
    transaction.prompt_for_payment

    previous_total = cash_register.total_money
    cash_register.accept_money(transaction)

    assert_equal(previous_total + transaction.amount_paid, cash_register.total_money)
  end
  
  def test_change
    transaction = Transaction.new(100)
    register = CashRegister.new(0)
  
    transaction.prompt_for_payment
    
    amount_paid = transaction.amount_paid
    item_cost = transaction.item_cost
    
    assert_equal(amount_paid - item_cost, register.change(transaction))
  end
  
  def test_give_receipt
    transaction = Transaction.new(100)
    register = CashRegister.new(0)
    
    assert_output("You've paid $100.\n") { register.give_receipt(transaction) }
  end
end
