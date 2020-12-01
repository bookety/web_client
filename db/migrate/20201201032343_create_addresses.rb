class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :number
      t.string :city
      t.string :complement
      t.string :address_type

      t.timestamps
    end
  end
end
