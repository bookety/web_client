class CreateProfessionals < ActiveRecord::Migration[6.0]
  def change
    create_table :professionals do |t|
      t.string :name
      t.string :nickname
      t.string :professional_type
      t.string :specialties
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
