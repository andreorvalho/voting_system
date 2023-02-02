class ChangeBallotOptions < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      change_table :ballots do |t|
        dir.up   { t.remove :options }
        dir.down { t.change :options, :text }
      end
    end
  end
end
