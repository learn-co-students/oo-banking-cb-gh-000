class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(money)
    @balance += money
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    # NOTE: a balance of 0 SHOULD be valid. Otherwise may cause errors on transfers since a receiver with 0 is not valid.
    !(@balance <= 0 || @status == "closed")
  end

  def close_account
    @status = "closed"
  end

end
