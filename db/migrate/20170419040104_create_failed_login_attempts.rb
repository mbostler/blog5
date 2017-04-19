class CreateFailedLoginAttempts < ActiveRecord::Migration[5.0]
  def change
    create_table :failed_login_attempts do |t|
      t.integer :user_id
      t.string :password
      t.datetime :submitted_at

      t.timestamps
    end
  end
end
