class CreateTravel < ActiveRecord::Migration[5.0]
  def change
    create_table :travels do |t|
      t.string :name, null: false
      t.references :person, foreign_key: true
      t.references :bus, foreign_key: true
      t.references :travel_route, foreign_key: true
      t.datetime :starting_at
      t.datetime :arrival_at
      t.references :service_type, foreign_key: true
      t.timestamps
    end
  end
end
