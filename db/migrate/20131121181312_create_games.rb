class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.boolean :ended
      t.integer :finishing_score
      t.timestamps
    end
  end
end
