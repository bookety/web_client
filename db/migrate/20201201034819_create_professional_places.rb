class CreateProfessionalPlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :professional_places do |t|
      t.references :place, null: false, foreign_key: true
      t.references :professional, null: false, foreign_key: true

      t.timestamps
    end
  end
end
