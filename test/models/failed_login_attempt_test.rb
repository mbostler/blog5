# == Schema Information
#
# Table name: failed_login_attempts
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  password     :string
#  submitted_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class FailedLoginAttemptTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
