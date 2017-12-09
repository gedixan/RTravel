class CreateAreas < ActiveRecord::Migration[5.0]
  def change
    create_table :areas do |t|
      t.string :name, null: false
      t.string :color, default: '#74847d'
      t.boolean :status, null: false, default: true
      t.timestamps
    end
  end
end
