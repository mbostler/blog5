# == Schema Information
#
# Table name: links
#
#  id          :integer          not null, primary key
#  name        :string
#  url         :string
#  source      :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Link < ApplicationRecord
  include PermissionMethods
  
  validates :url, presence: true
  has_many :content_permissions, as: :content_kind, dependent: :destroy
end
