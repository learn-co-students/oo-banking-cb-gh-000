class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, status = "pending", amount)
     @sender = sender
     @receiver = receiver
     @status = status
     @amount = amount
  end

  def valid?
     self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
          sender.withdrawal(self.amount)
          receiver.deposit(self.amount)
          self.status = "complete"
        else
          self.status = "rejected"
          "Transaction rejected. Please check your account balance."
        end
      end

      def reverse_transfer
        if valid? && receiver.balance > amount && self.status == "complete"
      sender.deposit(self.amount)
      receiver.withdrawal(self.amount)
      self.status = "reversed"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."      
    end
      end

end
