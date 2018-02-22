class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :name
      t.string :bio
      t.date :birthday
      t.interger :gender

      t.timestamps
    end
  end
end
