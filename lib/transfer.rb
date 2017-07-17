class Transfer

  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    if amount >= 0
      @sender = sender
      @receiver = receiver
      @amount = amount
    else
      @sender = receiver
      @receiver = sender
      @amount = -amount
    end
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.status == "pending"
      new_total = @sender.balance - amount
      if new_total < 0
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      else
        @sender.balance -= amount
        @receiver.balance += amount
        @status = "complete"
      end
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end

end
