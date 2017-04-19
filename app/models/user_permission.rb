# == Schema Information
#
# Table name: user_permissions
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  role_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserPermission < ApplicationRecord
  belongs_to :user
  belongs_to :role
  
  validates :role_id, uniqueness: { scope: :user_id,
    message: "cannot have multiple permissions to the same user" }
end
