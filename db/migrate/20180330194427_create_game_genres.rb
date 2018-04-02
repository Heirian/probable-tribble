class CreateGameGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :game_genres do |t|
      t.references :game
      t.references :genre
    end
  end
end
