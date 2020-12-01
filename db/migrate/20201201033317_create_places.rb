class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :company_name
      t.string :fantasy_name
      t.string :admin_full_name
      t.string :admin_job_position
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
