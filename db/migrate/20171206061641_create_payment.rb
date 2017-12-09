class CreatePayment < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :name, null: false
      t.decimal :amount, precision: 12, scale: 4, default: 0.0
      t.boolean :status, default: false
      t.references :travel, foreign_key: true
      t.datetime :payment_at, null: false
      t.timestamps
    end
    #precision: total de digitos
    #scala: digitos a partir de decimal
  end
end
