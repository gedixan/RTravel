class CreateStatusUser < ActiveRecord::Migration[5.0]
  def change
    create_table :status_users do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
