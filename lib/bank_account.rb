class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    validity = false
    if @status == "open" && @balance > 0
      validity = true
    end
    validity
  end

  def close_account
    @status = "closed"
  end


end
