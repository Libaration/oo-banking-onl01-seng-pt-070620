require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount = 50)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid? && sender.balance > @amount ? true : false
  end

  def execute_transaction
    if @status == 'pending' && valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = 'complete'
    elsif valid? == false
      @status = 'rejected'
      'Transaction rejected. Please check your account balance.'
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = 'reversed'
    end
  end
end
