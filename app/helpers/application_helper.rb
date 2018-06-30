module ApplicationHelper

	# If the page does not provide a title, use the base title.
	def full_title(page_title = '')
		base_title = "Beebings"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

end
