class CreateTmpMatches < ActiveRecord::Migration
  def change
    create_table :tmp_matches do |t|
      t.integer :user_id
      t.integer :take_user_id
      t.integer :game_mst_id
      t.boolean :private_flg
      t.integer :match_rule_id
      t.integer :adjust_time_id
      t.boolean :cancel_flg
      t.text :cancel_text

      t.timestamps
    end
  end
end
