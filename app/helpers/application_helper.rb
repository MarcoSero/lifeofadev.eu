module ApplicationHelper
  def current_url
    "#{request.protocol}#{request.host_with_port}#{request.fullpath}"
  end

  def pageless(total_pages, url=nil, container=nil)
    opts = {
      :totalPages => total_pages,
      :url        => url,
      :loaderMsg  => 'Loading more results',
      :loaderImage => image_path("load.gif")
    }
    
    container && opts[:container] ||= container
    
    javascript_tag("$('#results').pageless(#{opts.to_json});")
  end
end
