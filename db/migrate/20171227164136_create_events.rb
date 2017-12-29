class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.integer :size
      t.integer :location_id
      t.timestamps
    end
  end
end
