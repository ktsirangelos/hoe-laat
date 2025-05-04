class CreateArrivals < ActiveRecord::Migration[8.0]
  def change
    create_table :arrivals do |t|
      t.references :appointment, null: false, foreign_key: true
      t.references :tracker, null: false, foreign_key: { to_table: :users }
      t.references :trackable, polymorphic: true, null: false
      t.datetime :promised_time
      t.datetime :actual_time
      t.text :notes

      t.timestamps
    end
  end
end
