module ApplicationHelper
  def role_present?( role )
    current_user && current_user.has_role?( role )
  end
  
  def sorted_content_permissions( obj )
    obj.content_permissions.sort_by { |cp| cp.role.name }
  end

  def is_checked?( obj, role )
    obj.roles.include?( role )
  end
  
end
