class CreateUserPermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :user_permissions do |t|
      t.integer :user_id, null: false, uniq: true
      t.integer :role_id, null: false, uniq: true

      t.timestamps
    end
  end
end
