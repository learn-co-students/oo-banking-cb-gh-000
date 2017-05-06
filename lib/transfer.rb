class Transfer

  attr_reader :status
  attr_accessor :sender, :receiver, :amount

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
    unless valid? && sender.can_transfer(@amount)
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    
    if @status != "complete"
      @sender.retract(@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.retract(@amount)
      @status = "reversed"
    end
  end

end
