class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.references :profile
      t.references :game

      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
