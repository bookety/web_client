class CreateAvailableTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :available_times do |t|
      t.timestamp :start
      t.timestamp :end

      t.timestamps
    end
  end
end
