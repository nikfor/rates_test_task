class DepositPaymentsDecorator < Draper::CollectionDecorator
  def chart_data_buy
    data(:buy)
  end

  def chart_data_sell
    data(:sell)
  end

  private

  def data(attr_sym)
    object.inject({}) do |new_hash, o| 
      new_hash.merge(o.created_at.strftime("%H:%M") => o.send(attr_sym))
    end
  end
end