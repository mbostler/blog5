# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  name            :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password

  has_many :user_permissions, dependent: :destroy
  has_many :roles, through: :user_permissions
  has_many :failed_login_attempts, dependent: :destroy

  has_many :articles, dependent: :nullify, foreign_key: :author_id
  validates_uniqueness_of :name

  def self.method_missing( meth, *args, &block )
    u = where( "UPPER(name)=?", meth.to_s.upcase ).first
    u or super
  end

  def method_missing( meth, *args, &block )
    if (meth.to_s =~ /(.+)\?$/) && Role.find_by_name( $1 )
      send( :has_role?, $1 )
    else
      super
    end
  end

  def has_role?( role )
    roles.map( &:name ).include? role.to_s.downcase
  end

  def add_role( role )
    return true if roles.include?( role )
    if new_record?
      user_permissions.build :role_id => role.id
    else
      user_permissions.create! :role_id => role.id
    end
    role
  end

  def authenticate( pwd )
    submitted_at = DateTime.now
    limit = FailedLoginAttempt.count_today_for( self )

    if limit >= FailedLoginAttempt::LIMIT
      FailedLoginAttempt.log_fail( user: self, password: pwd, submitted_at: submitted_at )
      raise Login::TooManyFailedLoginAttemptsError.new( self )
    end

    result = super( pwd )

    unless result
      FailedLoginAttempt.log_fail( user: self, password: pwd, submitted_at: submitted_at )
    end
    result
  end
end
