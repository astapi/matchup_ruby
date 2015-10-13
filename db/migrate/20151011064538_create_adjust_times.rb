class CreateAdjustTimes < ActiveRecord::Migration
  def change
    create_table :adjust_times do |t|
      t.datetime :one
      t.datetime :two
      t.datetime :three

      t.timestamps
    end
  end
end
