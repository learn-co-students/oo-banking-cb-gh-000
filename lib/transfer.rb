class Transfer
  # your code here
  attr_reader :status, :amount
  def initialize(from, to, amount)
    @from = from 
    @to = to 
    @amount = amount
    @status = "pending"
  end
  
  def sender 
    @from 
  end 
  
  def receiver 
    @to 
  end
  
  def valid?
    @from.valid? && @to.valid?
  end
  
  def execute_transaction
    if @from.balance < @amount or @status == "complete"
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else 
      @from.balance -= @amount 
      @to.deposit(@amount)
      @status = "complete"
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @from.deposit(@amount)
      @to.balance -= @amount
      @status = "reversed"
    end
  end
end
