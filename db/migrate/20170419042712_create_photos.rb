class CreatePhotos < ActiveRecord::Migration[5.0]
  def self.up
    create_table :photos do |t|
      t.attachment :content
      t.integer :order
    end
  end

  def self.down
    remove_attachment :photos, :content
  end
end
