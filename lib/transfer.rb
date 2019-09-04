class Transfer
  attr_reader :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end
  
  def valid?
    sender.valid? && receiver.valid? && sender.balance > amount
  end
  
  def execute_transaction
    if valid? && self.status == "pending"
      sender.deposit(-self.amount)
      receiver.deposit(self.amount)
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if status == "complete"
      @status = "pending"
      @amount = -self.amount
      execute_transaction
      @status = "reversed"
    end
  end
end
