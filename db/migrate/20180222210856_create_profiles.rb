class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :username
      t.string :name
      t.string :bio
      t.string :phone
      t.date :birthday
      t.integer :gender

      t.timestamps
    end
  end
end
