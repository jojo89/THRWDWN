class CreateRolls < ActiveRecord::Migration
  def change
    create_table :rolls do |t|
      t.integer :points
      t.integer :score_id
      t.integer :dice_1
      t.integer :dice_2
      t.integer :dice_3
      t.integer :dice_4
      t.integer :dice_5
      t.integer :dice_6
      t.timestamps
    end
  end
end
