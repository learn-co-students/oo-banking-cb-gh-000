# Class is built to allow a 'transfer', or the exchange of an amount, between two 'Account' objects
# '@balance' instance variables.
class Transfer
  # Method initializes the instance variables needed for the class to function.
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    # Sets the default of '@status' to pending for all transfers.
    @status = "pending"
  end


  # Method uses the #valid? methods of the 'BankAccount' class for both accounts, as well as
  # ensuring that the '@sender' balance is at the amount of the transfer. Will return true if
  # all of these criteria are met.
  def valid?
    if @sender.valid? == true && @sender.balance >= amount && @receiver.valid? == true
      return true
    else
      return false
    end
  end


  # Method executes the transaction, so long as: the '@status' is currently pending (to prevent
  # the same transfer to execute multitple times), and that the #valid? method of the current
  # instance of the 'Transfer' object returns true. If these criteria are met, the amount will be
  # subtracted from the balance of '@sender' and added to the balance of '@reciever', and the
  # '@status' of the 'Transfer' object will be returned as 'complete'.
  # If these criteria are not met, the '@status' of the 'Transfer' object will be updated to
  # 'rejected' and will return a rejection message.
  def execute_transaction
    if self.valid? == true && @status == "pending"
      @sender.balance -= amount
      @receiver.balance += amount
      return @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end


  # Method will reverse the transfer if the '@status' of the transfer has already been updated to
  # 'complete', by adding the amount back to the '@sender' balance and subtract the amount back to
  # '@reciever', and finally update and return the '@status' to 'revered'.
  def reverse_transfer
    if @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      return @status = "reversed"
    end
  end

end
