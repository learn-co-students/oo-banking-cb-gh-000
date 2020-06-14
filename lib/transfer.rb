class Transfer
  # your code here
  attr_accessor :sender,:receiver,:amount,:status

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? and @receiver.valid? then
      true
    else
      false
    end
  end

  def execute_transaction
    unless @sender.valid? and @sender.balance >= amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end

    if @status != "complete"
      @receiver.deposit(@amount)
      @sender.balance -= @amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status!="pending"
      @sender.deposit(@amount)
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
