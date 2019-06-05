class Workers::Tinkoff::Rates < ::Workers::Base
  sidekiq_options queue: 'valutes'

  def perform
    params_array.each do |params|
      DepositPayment.create(params)
    end
  end

  private

  def params_array
    payments.map do |payment|
      {
        from_currency:  payment[:fromCurrency][:code],
        to_currency:    payment[:toCurrency][:code],
        buy:            payment[:buy],
        sell:           payment[:sell],
        last_update:    payment[:last_update]
      }
    end
  end

  def payments
    ::Services::API::Tinkoff::Categories::DepositPayments.run!
  end
end
