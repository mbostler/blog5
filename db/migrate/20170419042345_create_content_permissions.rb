class CreateContentPermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :content_permissions do |t|
      t.integer :role_id, null: false
      t.integer :content_kind_id
      t.string :content_kind_type

      t.timestamps
    end
  end
end
