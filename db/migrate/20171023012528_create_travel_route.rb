class CreateTravelRoute < ActiveRecord::Migration[5.0]
  def change
    create_table :travel_routes do |t|
      t.string :name, null: false
      t.string :starting_point, null: false
      t.string :arrival_point, null: false
      t.boolean :status, default: true
      t.timestamps
    end
  end
end
