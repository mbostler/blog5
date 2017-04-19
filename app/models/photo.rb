# == Schema Information
#
# Table name: photos
#
#  id                   :integer          not null, primary key
#  title                :string
#  album_id             :integer
#  description          :text
#  order                :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  content_file_name    :string
#  content_content_type :string
#  content_file_size    :integer
#  content_updated_at   :datetime
#

class Photo < ApplicationRecord
  belongs_to :album
  has_attached_file :content, 
                    :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                    :default_url => "/assets/images/:style/missing.png"
  validates_attachment_content_type :content, :content_type => /\Aimage\/.*\Z/
  
  scope :ordered, -> { order("photos.order, photos.created_at") }
  
  def next_photo
    album_photos = album.photos.ordered
    album_photo_ids = album_photos.map(&:id)
    pos = album_photo_ids.index(id)
    next_pos = pos + 1
    if (next_pos+1) > album_photos.size
      return nil
    else
      album_photos[next_pos]
    end
  end

  def prev_photo
    album_photos = album.photos.ordered
    album_photo_ids = album_photos.map(&:id)
    pos = album_photo_ids.index(id)
    prev_pos = pos - 1
    if (prev_pos) < 0
      return nil
    else
      album_photos[prev_pos]
    end
  end
end
