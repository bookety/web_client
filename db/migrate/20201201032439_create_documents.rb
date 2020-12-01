class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :document_type
      t.string :document_number

      t.timestamps
    end
  end
end
