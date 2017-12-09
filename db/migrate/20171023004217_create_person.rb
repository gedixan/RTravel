class CreatePerson < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :fname, null: false
      t.string :lname, null: false
      t.string :document
      t.date :birthday
      t.string :phone
      t.string :email
      t.string :address
      t.string :type
      t.timestamps
    end
  end
end
