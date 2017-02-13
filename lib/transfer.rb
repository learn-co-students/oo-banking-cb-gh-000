class Transfer

  attr_reader :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if @status == "pending"
      @sender.transfer(@amount, true)
      @receiver.transfer(@amount, false)
      @status = "complete"

      if reject_transfer?
        reverse_transfer
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reject_transfer?
    if @sender.valid?
      false
    else
      true
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.transfer(@amount, false)
      @receiver.transfer(@amount, true)
      @status = "reversed"
    end
  end

end
