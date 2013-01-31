class Movie < ActiveRecord::Base
	
  def self.all_ratings
 #self.select (:rating).map (&:rating).uniq
end
	
  def self.filter (selection)
#begin
#  self.where (:rating => selection.keys)
#rescue
#  self.where (:rating => selection)
#end
 end
end
