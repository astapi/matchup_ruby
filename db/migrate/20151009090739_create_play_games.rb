class CreatePlayGames < ActiveRecord::Migration
  def change
    create_table :play_games do |t|
      t.integer :user_id
      t.integer :game_mst_id
      t.integer :point

      t.timestamps
    end
  end
end
