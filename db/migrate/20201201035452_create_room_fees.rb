class CreateRoomFees < ActiveRecord::Migration[6.0]
  def change
    create_table :room_fees do |t|
      t.references :fee, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.references :available_time, null: false, foreign_key: true

      t.timestamps
    end
  end
end
