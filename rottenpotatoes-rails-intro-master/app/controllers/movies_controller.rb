class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    #@movies = Movie.with_ratings(params[:ratings])
    @all_ratings = Movie.all_ratings
    
    # Part 1: filter the list of movies by rating
    if params[:ratings] 
      @ratings_to_show = params[:ratings].keys
    elsif session[:ratings]
      @ratings_to_show = session[:ratings]
    end
    
    if @ratings_to_show == nil
      @ratings_to_show = Hash[@all_ratings.collect {|key| [key, 1]}]
    end
    
    @ratings_to_show_hash = Hash[@ratings_to_show.collect {|key| [key]}]
    
    if params[:order]
      sorted = params[:order]
    elsif session[:order]
      sorted = session[:order]
    end

    # # Part 2: sort the list of movies by title or release date
    if params[:order] == 'title'
      @movies = @movies.order(params[:order])
      @title_header = "hilite bg-warning"
    elsif params[:order] == 'release_date'
      @movies = @movies.order(params[:order])
      @release_date_header ="hilite bg-warning"
    else
      #@movies = Movie.all #for part 2
      @movies = Movie.with_ratings(params[:ratings]) # for part 1
    end
    
    
    
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end
end
