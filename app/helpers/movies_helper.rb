module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  def header_attrs(hilite)
    hilite == @hilite ? {:class => "hilite"} : {}
  end
  def sort_option_tag(field)
    case field
    when "title" then
      hidden_field_tag 'sort', 'title'
    when "release_date" then
      hidden_field_tag 'sort', 'release_date'
    end
  end
  
  def rating_checked?(rating)
    @ratings.has_key?(rating)
  end
  
  def movies_path_builder(hilite, ratings)
    # using @hilite & @ratings
    url = movies_path
    if hilite || !ratings.empty? then
      url << "?"
      if hilite then
        url << "sort=#{hilite}"
        if !ratings.empty? then
          url << "&"
        end
      end
      if !ratings.empty? then
        qeury_hash = Hash.new
        ratings.each { |k,v| qeury_hash["ratings[#{k}]"] = v }
        url << qeury_hash.to_query
      end
    end
    return url
  end
end
