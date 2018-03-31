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

require 'test_helper'

class HomepagePicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
