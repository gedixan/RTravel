class CreateTicket < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :name, null: false
      t.references :user, foreign_key: true
      t.references :person, foreign_key: true
      t.references :travel, foreign_key: true
      t.decimal :amount_paid, default: 0, precision: 8, scale: 2
      t.datetime :regristration_at, null: false
      t.timestamps
    end
  end
end
