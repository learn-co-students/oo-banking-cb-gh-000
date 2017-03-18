class BankAccount
  attr_reader :name, :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def retire(amount)
    @balance -= amount
  end

  def display_balance
    return "Your balance is $#{@balance}."
  end

  def balance=(amount)
    @balance = amount
  end

  def status=(status)
    @status = status
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def close_account
    @status = "closed"
  end

end
