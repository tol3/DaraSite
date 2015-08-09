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

	# def watch_view(num)
	# 	val = (num.to_i / 1000)
	# 	if val < 1
	# 		content_tag val.to_i
	# 	else
	# 		content_tag val
	# 	end
	# end

end
