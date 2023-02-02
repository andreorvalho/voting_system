class CreateRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :registrations do |t|
      t.references :voter, null: false, foreign_key: true, index: true
      t.references :election, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
