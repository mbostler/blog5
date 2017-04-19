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

require 'test_helper'

class UserPermissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
