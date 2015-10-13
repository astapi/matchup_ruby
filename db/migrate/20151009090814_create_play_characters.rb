class CreatePlayCharacters < ActiveRecord::Migration
  def change
    create_table :play_characters do |t|
      t.integer :user_id
      t.integer :character_mst_id
      t.boolean :main_flg

      t.timestamps
    end
  end
end
