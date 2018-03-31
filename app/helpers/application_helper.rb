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
  
  def banner_logo
    return "[x]" if HomepagePic.none?
    files = Dir[File.join(Rails.root, "app", "assets", "images", "homepage_photos", "*")]
    sample_imagepath = files.sample
    pic = HomepagePic.all.sample
    image_tag pic.content.url(:medium), size: "160x100", alt: pic.alt_text, title: pic.alt_text
  end
  
end
