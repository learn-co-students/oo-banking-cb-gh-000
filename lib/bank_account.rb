class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(money)
    return @balance += money
  end


  def display_balance
    return "Your balance is $#{@balance}."
  end

  def valid?
    if @balance > 0 && @status == "open"
      return true
    else
      return false
    end
  end

  def close_account
    return @status = "closed"
  end
end
