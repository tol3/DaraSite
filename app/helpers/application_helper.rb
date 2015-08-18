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

  def getNewsUrl(var)
    case var
    when 1
      return "gossip"
    when 2
      return "hotclip"
    when 3
      return "movie"
    when 4
      return "lakorn"
    when 5
      return "music"
    when 6
      return "socciety"
    when 7
      return "myidol"
    when 8
      return "beauty"
    when 9
      return "lifestyle"
    when 10
      return "travel"
    else
      return "search"
    end
  end

end
