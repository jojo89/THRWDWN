class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.boolean :ended
      t.timestamps
    end
  end
end
