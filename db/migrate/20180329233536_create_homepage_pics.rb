class CreateHomepagePics < ActiveRecord::Migration[5.1]
  def change
    create_table :homepage_pics do |t|
      t.attachment :content
      t.text :alt_text

      t.timestamps
    end
  end
end
