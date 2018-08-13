class Transfer
  
  attr_accessor :sender
  attr_accessor :receiver
  attr_accessor :status
  attr_accessor :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if @sender.valid? && @receiver.valid?
      return true 
    end 
    return false
  end
  
  def execute_transaction
    if valid?
      if @status == "pending" && @sender.balance > @amount
        @receiver.balance += @amount
        @sender.balance -= @amount
        @status = "complete"
      else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    else
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
