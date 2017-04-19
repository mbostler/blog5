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

require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
