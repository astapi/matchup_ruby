class CreateRuleMsts < ActiveRecord::Migration
  def change
    create_table :rule_msts do |t|
      t.string :rule

      t.timestamps
    end
  end
end
