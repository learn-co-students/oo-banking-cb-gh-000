class BankAccount
  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @status = "open"
    @name = name
    @balance = 1000
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def deposit(moni)
    @balance += moni
  end

  def valid?
    @balance > 0 && @status == "open"
  end

  def close_account
    @status = "closed"
  end

end
