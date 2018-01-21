class Transfer
  
  attr_accessor :status, :amount, :transfered_amount
  attr_reader :sender, :receiver
  
  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @transfered_amount = 0 
  end
  
  def valid?
    sender.valid? && receiver.valid? && sender.balance > amount
  end
  
  def execute_transaction
    if @transfered_amount == 0 && self.valid?
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
      @transfered_amount = amount
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @transfered_amount > 0 
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
      @transfered_amount = 0 
    end
  end
  
end





# learn spec/transfer_spec.rb --fail-fast






