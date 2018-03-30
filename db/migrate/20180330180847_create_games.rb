class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :website
      t.string :mode
      t.datetime :release
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Game.create_translation_table! title: :string, description: :string, body: :text
      end

      dir.down do
        Game.drop_translation_table!
      end
    end
  end
end
