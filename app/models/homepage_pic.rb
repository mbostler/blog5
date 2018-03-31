# == Schema Information
#
# Table name: homepage_pics
#
#  id                   :integer          not null, primary key
#  content_file_name    :string
#  content_content_type :string
#  content_file_size    :integer
#  content_updated_at   :datetime
#  alt_text             :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class HomepagePic < ApplicationRecord
  has_attached_file :content, 
                    :styles => { 
                      :large => "800x800>", 
                      :medium => "300x300>", 
                      :thumb => "100x100>" 
                    }, 
                    :default_url => "/assets/images/homepage_pics/:style/missing.png"
  validates_attachment_content_type :content, :content_type => /\Aimage\/.*\Z/
end
