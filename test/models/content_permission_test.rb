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

require 'test_helper'

class ContentPermissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
