# == Schema Information
#
# Table name: content_permissions
#
#  id                :integer          not null, primary key
#  role_id           :integer          not null
#  content_kind_id   :integer
#  content_kind_type :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class ContentPermission < ApplicationRecord
  belongs_to :content_kind, polymorphic: true#, required: true
  belongs_to :role, required: true
  
  def role_id_for_box
    role and role.id
  end
end
