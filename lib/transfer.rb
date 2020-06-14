class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    self.sender.valid? && self.receiver.valid? ? true : false
  end
  
  def execute_transaction
    
    if self.valid? && sender.balance >= self.amount
      if self.status != "complete"
        self.sender.balance -= self.amount
        self.receiver.deposit(self.amount)
        self.status = "complete"
      end
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
      if self.status == "complete"
        self.sender.deposit(self.amount)
        self.receiver.deposit(-self.amount)
        self.status = "reversed"
      end
  end
end
