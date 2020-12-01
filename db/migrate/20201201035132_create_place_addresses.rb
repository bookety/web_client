class CreatePlaceAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :place_addresses do |t|
      t.references :place, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
