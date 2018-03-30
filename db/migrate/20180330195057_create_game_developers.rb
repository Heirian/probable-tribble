class CreateGameDevelopers < ActiveRecord::Migration[5.2]
  def change
    create_table :game_developers do |t|
      t.references :game
      t.references :developer
    end
  end
end
