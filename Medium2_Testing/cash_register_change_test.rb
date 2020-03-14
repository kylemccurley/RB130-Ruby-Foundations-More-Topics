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
end

#  Test that the change method in cash_register returns the difference 
#  between the amount_paid and the item's cost.
#  
#  - Create an object from Transaction class
#  - Create an object from the CashRegister class
#  
#  - Trigger the prompt for payment method from Tranaction
#    - Sets the instance variable amount_paid for the Transaction class.
#    
#  - Set a local variable for the amount paid set in the Transaction class.
#    - Set to the getter method for amount paid in Transaction
#  - Set a local variable for the cost of the item from the Transaction class. 
#  
# - Pass the difference between the amount paid and the item cost to the
#   assert_equal method, compared to the return value of change() from the 
#   CashRegister class.
