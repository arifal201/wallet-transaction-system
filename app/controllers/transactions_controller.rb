class TransactionsController < ApplicationController
  before_action :logged_in

  def create
    ActiveRecord::Base.transaction do
      @current_user.wallet || @current_user.create_wallet(balance: 0.0)
      @transaction = Transaction.new(transaction_params.merge({user: @current_user}))
      if transaction_params[:transaction_type] == :debit
        if @transaction.save
          @current_user.wallet.add_money(transaction_params[:amount])
        else
          return false
        end
      else
        if @transaction.save
          @current_user.wallet.subtract_money(transaction_params[:amount])
        else
          return false
        end
      end
    end
    response_success(@transaction, 'success create transaction')
  rescue StandardError => e
    response_error
  end

  private

  def transaction_params
    params.require(:transactions).permit(:amount, :transaction_type, :symbol, :identifier)
  end
end
