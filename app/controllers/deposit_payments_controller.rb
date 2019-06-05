class DepositPaymentsController < ApplicationController

  def euro
    @eur_rub = DepositPayment.eur_rub_day
    @eur_usd = DepositPayment.eur_usd_day
    @eur_gbp = DepositPayment.eur_gbp_day
  end

  def usd
    @usd_rub = DepositPayment.usd_rub_day
    @usd_eur = DepositPayment.usd_eur_day
    @usd_gbp = DepositPayment.usd_gbp_day
  end
end
