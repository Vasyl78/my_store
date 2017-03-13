module ApplicationHelper

	def urls_to_mail(s)
		s.gsub! /\s([\w-\.]+@([\w-]+\.)+[\w-]{2,4})\s/,
		# /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
		'<p>\1</p>'

		#'<a href="mailto:vlad@htmlbook.ru">Задавайте вопросы по электронной почте</a>'	
		s.html_safe		
	end

	#def urls_to_images(s)
	#	s.gsub! /\s(http:\/\/.*?\.(png|jpg))\s/,
	#		'<p><img src="\1"/></p>'
	#	s.html_safe
	#end

	#def urls_to_links(s)
	#	s.gsub! /\s(http:\/\/.*?)\s/,
	#	'<a href="\1">\1</a>'
		#s.html_safe

	#end

	

end
