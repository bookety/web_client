class CreateClientDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :client_documents do |t|
      t.references :client, null: false, foreign_key: true
      t.references :document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
