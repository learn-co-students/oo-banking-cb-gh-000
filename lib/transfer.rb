class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if valid? && self.status == "pending" && @sender.balance > amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status == "complete"
      "Transfer done right."
    else
      self.status == "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && self.status == "complete" && @sender.balance > amount
      @sender.balance += @amount
      @receiver.balance -= @amount
      self.status == "reversed"
    else
      self.status == "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

end
