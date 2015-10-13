class CreateCharacterMsts < ActiveRecord::Migration
  def change
    create_table :character_msts do |t|
      t.integer :game_mst_id
      t.string :character_name

      t.timestamps
    end
  end
end
