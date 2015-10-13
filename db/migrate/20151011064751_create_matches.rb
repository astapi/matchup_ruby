class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :user_id
      t.integer :take_user_id
      t.integer :game_mst_id
      t.boolean :private_flg
      t.integer :match_rule_id
      t.datetime :match_time
      t.text :streaming_url
      t.integer :like_count

      t.timestamps
    end
  end
end
