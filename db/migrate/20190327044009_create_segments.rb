class CreateSegments < ActiveRecord::Migration[5.2]
  def change
    create_table :segments do |t|
      t.string :departure_airport
      t.string :arrival_airport
      t.integer :carrier
      t.integer :booking_class
      t.integer :tp

      t.timestamps
    end
  end
end
