class CreateRolls < ActiveRecord::Migration
  def change
    create_table :rolls do |t|
      t.integer :points
      t.integer :score_id
      t.integer :dice_left
      t.integer :hot_dice
      t.timestamps
    end
  end
end
