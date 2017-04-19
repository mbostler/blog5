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

class FailedLoginAttempt < ApplicationRecord
  LIMIT = 3
  belongs_to :user
  
  # scope :count_today_for, ->(u) { where( "user_id = ? AND DATE(SUBMITTED_AT)=?", u.id, Date.today ) }

  def initialize(opts={})
    super(opts)
    self.submitted_at = DateTime.now
  end
  
  def self.count_today_for( user )
    where( "user_id = ? AND DATE(SUBMITTED_AT)=?", user.id, Date.today ).size
  end
  
  def self.log_fail( opts )
    raise "no user passed" unless opts[:user] and opts[:user].is_a?(User)
    
    opts[:user].failed_login_attempts.create!( password: opts[:password],
                                           submitted_at: opts[:submitted_at] )
  end
end
