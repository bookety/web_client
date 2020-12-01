class CreateProfessionalDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :professional_documents do |t|
      t.references :document, null: false, foreign_key: true
      t.references :professional, null: false, foreign_key: true

      t.timestamps
    end
  end
end
