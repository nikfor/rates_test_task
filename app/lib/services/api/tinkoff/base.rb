class Services::API::Tinkoff::Base < ActiveInteraction::Base
  def execute
    rates.map { |a | a.merge(last_update: payload[:lastUpdate][:milliseconds]) }
  end

  private

  def rates
    payload[:rates].select { |r| r[:category].eql?(category) }
  end

  def payload
    JSON.parse(response.body, symbolize_names: true)[:payload]
  end

  def response
    HTTParty.get('https://www.tinkoff.ru/api/v1/currency_rates/')
  end
end