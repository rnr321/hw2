class Movie < ActiveRecord::Base
def self.all_ratings
    self.group(:rating).map { |movie| movie.rating }
  end
end
