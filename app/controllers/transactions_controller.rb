class TransactionsController < ApplicationController
  before_action :logged_in

  def create
    ActiveRecord::Base.transaction do
      @current_user.wallet || @current_user.create_wallet(balance: 0.0)
      @current_user.transactions.lock!
      if transaction_params[:transaction_type] == 'debit'
        if @current_user.transactions.create!(transaction_params)
          @current_user.wallet.add_money(transaction_params[:amount])
        else
          return false
        end
      else
        if @current_user.transactions.create!(transaction_params)
          @current_user.wallet.subtract_money(transaction_params[:amount])
        else
          return false
        end
      end
    end
    response_success(@current_user.transactions.last, 'success create transaction')
  rescue StandardError => e
    response_error
  end

  private

  def transaction_params
    params.require(:transactions).permit(:amount, :transaction_type, :symbol, :identifier, :open, 
      :day_high, :day_low, :last_price, :previous_close, :change, :p_change, :year_high, :year_low, 
      :total_traded_volume, :total_traded_value, :last_update_time, :per_change_365d, :per_change_30d)
  end
end
