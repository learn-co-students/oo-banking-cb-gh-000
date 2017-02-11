class Transfer

  attr_reader :sender, :receiver, :amount, :status


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? and @receiver.valid? and @sender.balance >= @amount
  end

  def execute_transaction
    if @status.eql?("pending") and self.valid?
      @sender.deposit(@amount * -1)
      @receiver.deposit(@amount)
      @status = "complete"
    elsif !self.valid?
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status.eql?("complete")
      @sender.deposit(@amount)
      @receiver.deposit(@amount * -1)
      @status = "reversed"
    end
  end

end
