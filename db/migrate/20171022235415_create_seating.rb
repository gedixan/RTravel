class CreateSeating < ActiveRecord::Migration[5.0]
  def change
    create_table :seatings do |t|
      t.string :name, null: false
      t.boolean :status, default: true
      t.references :bus, foreign_key: true
      t.timestamps
    end
  end
end
