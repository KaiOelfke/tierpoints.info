class CreateRuns < ActiveRecord::Migration[5.2]
  def change
    create_table :runs do |t|
      t.string :departure_airport
      t.string :arrival_airport
      t.integer :carrier
      t.integer :booking_class
      t.boolean :expired
      t.integer :tp
      t.integer :price_cents
      t.float :price_tp_ratio
      t.string :itinerary

      t.timestamps
    end
  end
end
