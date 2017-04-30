class Transfer
  attr_accessor :status , :sender , :receiver , :amount
  def initialize(sender,receiver,amount)
  @status = 'pending'
  @sender = sender
  @receiver = receiver
  @amount = amount
  end
  def valid?
    #because sender and reciever are objects them selfes
    sender.valid? && receiver.valid?
  end
  def execute_transaction
    if ok_to_transfer?
    sender.balance -= amount
    receiver.balance += amount
    self.status = "complete"
    else
      rejected
    end
  end
  def rejected
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
  def ok_to_transfer?
    valid? && sender.balance > amount && self.status == "pending"
  end
  def reverse_transfer
    if ok_to_reverse
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    else
      rejected
    end
  end
  def ok_to_reverse
    valid? && sender.balance > amount && self.status == "complete"
  end
end
