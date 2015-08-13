module ApplicationHelper
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'current' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

  def title(page_title)
		content_for(:title) { page_title }
	end

	def facebook_shares(url)
    data = Net::HTTP.get(URI.parse("http://graph.facebook.com/?ids=#{URI.escape(url)}"))
    data = JSON.parse(data)
    if data.kind_of?(Hash)
      return data[url]['shares']
    else
      return 0
    end
	end

end
