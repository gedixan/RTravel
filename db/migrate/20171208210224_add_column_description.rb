class AddColumnDescription < ActiveRecord::Migration[5.0]
  def up
  	add_column :buses, :description, :string
  end

  def down
    remove_column :buses, :description
  end
end
