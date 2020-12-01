class CreatePlaceDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :place_documents do |t|
      t.references :place, null: false, foreign_key: true
      t.references :document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
