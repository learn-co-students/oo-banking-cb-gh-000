require 'pry'
class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def close_account
    @status = "closed"
  end

  def deposit(amount)
    @balance = @balance + amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def transfer(amount, sender)
    if sender
      @balance = @balance - amount
    else
      @balance = @balance + amount
    end
  end

  def valid?
    @balance > 0 && @status == "open" ? true : false
  end

end
