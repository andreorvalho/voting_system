class CreateBallots < ActiveRecord::Migration[7.0]
  def change
    create_table :ballots do |t|
      t.string :name
      t.string :type
      t.text :options
      t.belongs_to :election, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
