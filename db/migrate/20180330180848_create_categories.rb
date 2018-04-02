class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories, &:timestamps

    reversible do |dir|
      dir.up do
        Category.create_translation_table! title: :string
      end

      dir.down do
        Category.drop_translation_table!
      end
    end
  end
end
