class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.attachment :content
      t.integer :order
    end    
  end
end
