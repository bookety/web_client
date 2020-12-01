class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.string :room_number
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
