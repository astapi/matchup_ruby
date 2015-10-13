class CreateMatchRules < ActiveRecord::Migration
  def change
    create_table :match_rules do |t|
      t.integer :rule_mst_id
      t.integer :match_count

      t.timestamps
    end
  end
end
