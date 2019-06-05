class CreateDepositPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :deposit_payments do |t|
      t.integer   :from_currency, null: false
      t.integer   :to_currency, null: false
      t.decimal   :buy, precision: 20, scale: 10
      t.decimal   :sell, precision: 20, scale: 10
      t.string    :last_update, null: false
      t.timestamps
    end
  end
end
