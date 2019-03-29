class CreateRunSegment < ActiveRecord::Migration[5.2]
  def change
    create_table :run_segments do |t|
      t.references :run, foreign_key: true
      t.references :segment, foreign_key: true
      t.integer :position
      t.index [:run_id, :segment_id]
      t.index [:segment_id, :run_id]
    end
  end
end
