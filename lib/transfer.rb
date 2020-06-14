class Transfer

  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.valid? && @status == "pending"
      if @sender.balance < @amount
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      else
        @sender.retire(@amount)
        @receiver.deposit(@amount)
        @status = "complete"
      end
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.retire(@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end

end
