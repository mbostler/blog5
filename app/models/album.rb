# == Schema Information
#
# Table name: albums
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  author_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Album < ApplicationRecord
  include PermissionMethods
  
  has_many :photos, dependent: :destroy
  has_many :content_permissions, as: :content_kind, dependent: :destroy
  belongs_to :author, class_name: "User"
  validates_presence_of :author_id
  
  default_scope { order( "albums.created_at DESC" ) }
  
  def last_updated_photo
    photos.sort { |a, b| a.updated_at <=> b.updated_at }.last
  end
  
  def self.upload( path, author_name )
    author = User.find_by_name author_name
    txt = "cannot find author on suggested name #{author_name.inspect}"
    raise( txt ) unless author
    
    if File.directory?( path )
      album_name = File.basename( path )
      photo_paths = Dir[path+"/*"].select do |filename|
        File.extname( filename ) =~ /png|gif|jpe?g/i
      end

      ActiveRecord::Base.transaction do
        album = Album.create! author_id: author.id
        photo_paths.each_with_index do |photo_path, i|
          album.photos.create! content: File.open(photo_path, "rb"), title: "Photo #{i+1}"
        end
      end
    else
      raise "not sure how to upload when not a directory"
    end
  end
end
