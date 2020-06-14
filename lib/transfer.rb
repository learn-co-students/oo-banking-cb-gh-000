class Transfer
  # your code here
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver , amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    end
    return false
  end
  
  def execute_transaction
    if !@sender.valid? || @sender.balance - @amount < 0
      # Reject Transfer
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    
    if @status == "pending"
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @receiver.deposit(-@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end 
end
