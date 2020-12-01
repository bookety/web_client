class CreateClientTelephones < ActiveRecord::Migration[6.0]
  def change
    create_table :client_telephones do |t|
      t.references :client, null: false, foreign_key: true
      t.references :telephone, null: false, foreign_key: true

      t.timestamps
    end
  end
end
