# Class is built to act as an individual bank account, with methods to determine balance,
# account status, and the ability to deposit money.
class BankAccount
  # Method initializes the instance variables needed for the class to function.
  attr_accessor :balance, :status
  attr_reader :name
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end


  # Method takes in the argument of 'money', and returns the '@balance' of the account updated with
  # the amount of 'money' added in.
  def deposit(money)
    return @balance += money
  end


  # Method returns the '@balance' instance variable (amount of money) currently in the 'Account' object.
  def display_balance
    return "Your balance is $#{@balance}."
  end


  # Method checks if the 'Account' object is valid by checking that the current '@balance' instance
  # variable is more than zero, and that the '@status' instance variable is currently set to open
  # and returns 'true' if both of these criteria are met.
  def valid?
    if @balance > 0 && @status == "open"
      return true
    else
      return false
    end
  end


  # Method updates and returns the '@status' instance variable to closed.
  def close_account
    return @status = "closed"
  end
end
