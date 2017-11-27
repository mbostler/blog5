module PermissionMethods
  def self.included( base )
    base.extend PermissionClassMethods
    
    base.class_eval do
      has_many :content_permissions, -> { joins(:role).order( "UPPER(roles.name)" ) }, as: :content_kind, dependent: :destroy
      has_many :roles, -> { order( "UPPER(name)" ) }, through: :content_permissions
      scope :all_authorized_for_roles, ->( roles ) { includes( :roles ).where( roles: {id: roles.map(&:id) } )}
      scope :all_authorized_for_user, ->(user) { includes( :roles ).where( roles: {id: user.role_ids} )}
    end
  end
  
  attr_accessor :content_permissions_flags
  # def add_permission!( role )
  #   return roles if roles.include?( role )
  #
  #   save! if new_record?
  #
  #   # if new_record?
  #   #   content_permissions.build role_id: role.id
  #   # else
  #   #   content_permissions.create! role_id: role.id
  #   # end
  #   content_permissions.create! role_id: role.id
  # end
  #
  def set_permissions( new_roles )
    preserved_roles = self.roles & new_roles
    roles_to_remove = self.roles - preserved_roles
    roles_to_add    = new_roles - preserved_roles
    
    remove_roles roles_to_remove
    add_roles roles_to_add
  end
  
  def remove_roles( roles_to_remove )
    roles_to_remove.each { |r| remove_role( r ) }
  end
  
  def remove_role( r )
    content_permissions.joins( :role ).where( roles: { id: r.id } ).each(&:destroy)
  end
  
  def add_roles( roles_to_add )
    roles_to_add.each { |r| add_role( r ) }
  end
  
  def add_role( r )
    roles << r
  end
  
  def content_permissions_flags=( hsh )
    roles = hsh.keys.map { |name| Role.find_by(name: name) }.compact
    set_permissions roles
  end
  
  def authorized_for?( user )
    if user.present? && user.roles.include?( Role.admin )
      true
    elsif user.present?
      (user.roles & roles).any?
    else
      roles.include? Role.public
    end    
  end
  
  def build_roles
    Role.all.each do |role|
      unless roles.include?( role )
        content_permissions.build role_id: role.id
      end
    end
  end
  
  
  module PermissionClassMethods    
    
    def all_authorized_for( user )
      if user.present? && user.roles.include?( Role.admin )
        all
      elsif user.present?
        all_authorized_for_user( user )
      else
        all_authorized_for_roles [Role.public]
      end
    end
    
  end
  # scope :published, -> { where( is_published: true ) }
  #
  # def published_for_user( user )
  #   if user.admin?
  #     published
  #   else
  #     published.
  #     includes(:permissions).
  #     where( "permissions.user_id=? AND is_allowed=?", user.id, true )
  #   end
  # end
end