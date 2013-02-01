module ApplicationHelper

 def sortlist (column, title = nil, filter, css_class)
	
title ||= column.titleize
css_id = column == :sort_column ? "hilite" : "#{column}_header"
direction = column == :sort_column && :sort_direction == "asc" ? "desc" : "asc"
link_to title, {:sort => column, :direction => direction}, {:id => css_id}
 end

 def th_class (column)
css_class = column == params[:sort] ? "hilite" : nil
end
end
