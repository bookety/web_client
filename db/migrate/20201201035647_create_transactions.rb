class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :professional_fee, null: false, foreign_key: true
      t.references :room_fee, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
