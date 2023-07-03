class WalletsController < ApplicationController
  before_action :logged_in
  before_action :set_wallet, only: :show

  def wallet_topup
    ActiveRecord::Base.transaction do 
      if @current_user.try(:wallet)
        @current_user.wallet.with_lock do 
          @current_user.try(:wallet).add_money(params[:wallet][:amount])
        end
      else
        response_error
      end
    end
    response_success(@current_user.try(:wallet), "success top up #{params[:wallet][:amount]}")
  rescue StandardError
    response_error
  end

  def show
    response_success(@wallet, 'success get wallet')
  end

  private

  def set_wallet
    @wallet = Wallet.find(params[:id])
  rescue StandardError
    response_error
  end
end
