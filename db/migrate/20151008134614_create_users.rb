class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :twitter_id, :limit => 8
      t.string :twitter_screen_name
      t.string :oauth_token
      t.string :oauth_token_secret
      t.string :site_token
      t.datetime :site_token_limit

      t.timestamps
    end
  end
end
