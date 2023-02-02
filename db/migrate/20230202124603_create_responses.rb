class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.references :ballot, null: false, foreign_key: true
      t.text :value, null: true
      t.references :option, null: true, foreign_key: true
      t.references :voter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
