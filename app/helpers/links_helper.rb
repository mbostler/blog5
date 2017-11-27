module LinksHelper
  def link_title( link )
    if link.name.present?
      (link.name + " [#{link_to( link.url, link.url, target: "_blank" )}]").html_safe
    else
      link_to link.url, link.url, target: "_blank"
    end
  end
end
