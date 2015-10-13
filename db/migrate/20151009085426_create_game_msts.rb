class CreateGameMsts < ActiveRecord::Migration
  def change
    create_table :game_msts do |t|
      t.string :game_name
      t.string :point_name

      t.timestamps
    end
  end
end
