module ApplicationHelper

	def urls_to_mail(s)
		s.gsub(/\s([\w\.]+@([\w]+\.)+[\w]{2,4})\s/,	'<a href="mailto:\1">\1</a></br>').html_safe		
	end

	def urls_to_images(s)
		s.gsub(/\s((http|https):\/\/.*?\.(png|jpg))\s/, '<p><img src="\1"/></p>').html_safe
		
	end

	def urls_to_links(s)
		s.gsub(/\s((http|https):\/\/.*?)\s/, '<a href="\1">\1</a></br>').html_safe

	end

end
