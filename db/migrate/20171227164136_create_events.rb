class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.string :time
      t.integer :location_id
      t.timestamps
    end
  end
end
