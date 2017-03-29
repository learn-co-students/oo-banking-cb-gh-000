class BankAccount
  attr_accessor :balance,:status
  attr_reader :name

  def initialize name
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit money
    @balance+=money
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def close_account
    @status = "closed"
  end

  def valid?
    valid_status? && valid_deposit?
  end

  def valid_sender? amount
    valid? && @balance >= amount
  end

  def valid_status?
    @status == "open"
  end

  def valid_deposit?
    @balance > 0
  end
end
