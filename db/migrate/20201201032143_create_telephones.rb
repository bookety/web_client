class CreateTelephones < ActiveRecord::Migration[6.0]
  def change
    create_table :telephones do |t|
      t.string :telephone_type
      t.string :telephone_number

      t.timestamps
    end
  end
end
