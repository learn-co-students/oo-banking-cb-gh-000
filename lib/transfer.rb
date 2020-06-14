class Transfer
  # your code here
  attr_reader :sender, :receiver, :status, :amount
  def initialize sender, receiver, money
    @sender     = sender
    @receiver   = receiver
    @amount     = money
    @status     = "pending"
    @first_time = true
  end

  def valid?
    @sender.valid_sender?(@amount) && @receiver.valid? && @first_time
  end

  def execute_transaction
    unless valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    @first_time = false
    @sender.deposit(-@amount)
    @receiver.deposit(@amount)
    @status = "complete"
  end

  def reverse_transfer
    return "" if @first_time
    @sender.deposit(@amount)
    @receiver.deposit(-@amount)
    @status = "reversed"
  end
end
