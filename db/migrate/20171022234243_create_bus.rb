class CreateBus < ActiveRecord::Migration[5.0]
  def change
    create_table :buses do |t|
      t.string :name, null: false
      t.string :num_policy, null: false
      t.boolean :status, default: true
      t.timestamps
    end
  end
end
