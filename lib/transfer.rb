class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? and receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.status == "pending" and valid? and sender.balance > amount
      sender.balance -= amount
      receiver.balance+= amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete" and valid? and receiver.balance > amount
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

end
