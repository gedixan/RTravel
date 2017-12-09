class CreateRole < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :name, null: false
      t.boolean :is_base, default: false
      t.boolean :is_agent, default: false
      t.boolean :is_supervisor, default: false
      t.timestamps
    end
  end
end
