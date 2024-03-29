class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.all_ratings
    @ratings = params[:ratings] ? params[:ratings] : {}
    @selected = @ratings.keys
    @hilite = params[:sort]	
    #@movies = Movie.all
    @movies = case params[:sort]   
    when "title" then
      if @selected.empty? then
       Movie.order("title ASC")
      else
        Movie.where(:rating => @selected).order("title ASC")
      end
    when "release_date" then
      if @selected.empty? then
        Movie.order("release_date ASC")
      else
        Movie.where(:rating => @selected).order("release_date ASC")
      end
    else
      if @selected.empty? then
        Movie.all
      else
        Movie.where(:rating => @selected).order("title ASC")
     end
      
    end
    
    
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
