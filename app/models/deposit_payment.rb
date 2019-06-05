class DepositPayment < ApplicationRecord
  enum from_currency: { rub: 643, gbp: 826, usd: 840, eur: 978 }, _prefix: true
  enum to_currency: { rub: 643, gbp: 826, usd: 840, eur: 978 }, _prefix: true

  validates :from_currency, :to_currency, :last_update, presence: true
  validates :buy, :sell, numericality: true
  validates :last_update, uniqueness: true
  validate :currencies_must_be_different

  scope :daily_rates, -> { where(created_at: (DateTime.current - 24.hours) .. DateTime.current) }

  scope :eur_rub_day, -> { from_currency_eur.to_currency_rub.daily_rates }
  scope :eur_usd_day, -> { from_currency_eur.to_currency_usd.daily_rates }
  scope :eur_gbp_day, -> { from_currency_eur.to_currency_gbp.daily_rates }

  scope :usd_rub_day, -> { from_currency_usd.to_currency_rub.daily_rates }
  scope :usd_eur_day, -> { from_currency_usd.to_currency_eur.daily_rates }
  scope :usd_gbp_day, -> { from_currency_usd.to_currency_gbp.daily_rates }

  def currencies_must_be_different
    errors.add(:base, 'from currency must be different to currency') if 
      from_currency == to_currency
  end
end
