class BankAccount
  
  attr_accessor :open, :balance , :status 
  attr_reader :name 
  
  def initialize(name)
    @name = name 
    self.balance = 1000
    self.status = "open"
  end 
  
  def deposit(balance)
    self.balance += balance
  end 
  
  def display_balance
    "Your balance is $#{self.balance}."
  end 
  
  def valid?
    self.balance > 0 && self.status == "open"
  end 
  
  def close_account
    self.status = "closed"
  end 
  
end
