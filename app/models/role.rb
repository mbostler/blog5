# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ApplicationRecord
  has_many :user_permissions, :dependent => :destroy
  # has_many :content_permissions, :dependent => :destroy
  
  validates :name, uniqueness: true, presence: true
  
  def self.method_missing( meth, *args, &block )
    r = where( :name => meth.to_s.downcase ).first
    r or super
  end
end
