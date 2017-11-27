# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ApplicationRecord
  include PermissionMethods
  belongs_to :author, class_name: 'User'
  
  scope :recent, -> { order( created_at: :desc ).limit( 3 ) }
  scope :for, ->( roles ) { includes( :roles ).where( roles: {id: roles.map(&:id)} )}
  
  default_scope { order( "articles.created_at DESC" ) }
end
