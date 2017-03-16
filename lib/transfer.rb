class Transfer
  attr_reader :amount, :receiver, :sender, :status

  def initialize(sender, receiver, amount)
    @amount = amount
    @receiver = receiver
    @sender = sender
    @status = "pending"
  end

  def execute_transaction
    if valid? && sender.balance >= amount && @status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if valid? && receiver.balance >= amount && @status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      @status = "reversed"
    else
      reject_transfer
    end
  end

  def valid?
    sender.valid? && receiver.valid?
  end
end
