class CreateGameScores < ActiveRecord::Migration[7.0]
  def change
    create_table :game_scores do |t|
      t.integer :score
      t.string :game_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
