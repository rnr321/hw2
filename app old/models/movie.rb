class Movie < ActiveRecord::Base
	
  def self.all_ratings
   a = Array.new
  self.select("a").uniq.each {|e| a.push(e.rating)}
  rating.sort.uniq
end
	
  def self.filter (selection)
 begin
 self.where (:rating selection.keys)
 rescue
 self.where (:rating selection)
 end
end
end
