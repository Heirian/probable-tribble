class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.references :member
      t.references :community
      t.boolean :approved, default: false, null: false
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
