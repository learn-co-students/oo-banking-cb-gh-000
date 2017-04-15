class BankAccount
  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance = @balance + amount
  end

  def withdraw(amount)
    if self.valid? && amount < @balance
      @balance = @balance - amount
    else
      "Transaction not valid"
    end
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    (@balance > 0 && @status =="open") ? true : false
  end

  def close_account
    @status = "closed"
  end
end
