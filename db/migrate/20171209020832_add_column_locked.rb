class AddColumnLocked < ActiveRecord::Migration[5.0]
  def up
    add_column :buses, :locked, :boolean, default: false
  end

  def down
    remove_column :buses, :locked
  end
end
