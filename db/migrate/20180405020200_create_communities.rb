class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.references :owner
      t.references :game
      t.string :name, null: false
      t.text :body, null: false
      t.boolean :require_approval, default: false
      t.integer :kind
      t.integer :secrecy

      t.timestamps
    end
  end
end
