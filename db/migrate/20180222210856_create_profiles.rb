class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :username, null: false, default: ""
      t.string :name
      t.string :bio
      t.string :phone
      t.string :website
      t.boolean :active, default: true
      t.date :birthday
      t.integer :gender

      t.timestamps
    end
  end
end
