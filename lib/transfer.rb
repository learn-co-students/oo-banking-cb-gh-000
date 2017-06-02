class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
    @executed = false
  end
  def valid?
    @sender.valid? && @receiver.valid?
  end
  def execute_transaction
    if @sender.balance < @amount
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    else
      if !@executed
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = 'complete'
        @executed = true
      end
    end
  end
  def reverse_transfer
    if @status == 'complete'
      @status  = 'reversed'
      @sender.balance += @amount
      @receiver.balance -= @amount
    end
  end
end
