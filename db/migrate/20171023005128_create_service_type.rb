class CreateServiceType < ActiveRecord::Migration[5.0]
  def change
    create_table :service_types do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.boolean :status, default: true
      t.timestamps
    end
  end
end
