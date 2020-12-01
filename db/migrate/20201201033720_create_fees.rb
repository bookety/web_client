class CreateFees < ActiveRecord::Migration[6.0]
  def change
    create_table :fees do |t|
      t.string :fee_type
      t.integer :fee_value_in_cents

      t.timestamps
    end
  end
end
