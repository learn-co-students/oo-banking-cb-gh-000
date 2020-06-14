class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @balance = 1000
    @status = 'open'
    @name = name
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    puts "Your balance is $#{@balance}."
    "Your balance is $#{@balance}."
  end

  def valid?
    @status == 'open' and @balance > 0
  end

  def close_account
    @status = 'closed'
    @balance = 0
  end

end
