class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.string :value
      t.references :ballot, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
