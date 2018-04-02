class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres, &:timestamps

    reversible do |dir|
      dir.up do
        Genre.create_translation_table! title: :string
      end

      dir.down do
        Genre.drop_translation_table!
      end
    end
  end
end
