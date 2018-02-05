class MoviesController < ApplicationController
  def index
    @movies = Movie.all

    render("movie_templates/index.html.erb")
  end

  def show
    @movie = Movie.find(params[:id_to_display])

    render("movie_templates/show.html.erb")
  end

  def new_form
    @movie = Movie.new
    render("movie_templates/new_form.html.erb")
  end

  def create_row
    @movie = Movie.new

    @movie.title = params[:title]
    @movie.description = params[:description]
    @movie.favorite = params[:favorite]

    save_status = @movie.save

    if save_status == true
      redirect_to("/movies", :notice => "Movie created successfully.")
    else
      render("movie_templates/new_form.html.erb")
    end
  end

  def edit_form
    @movie = Movie.find(params[:prefill_with_id])

    render("movie_templates/edit_form.html.erb")
  end

  def update_row
    @movie = Movie.find(params[:id_to_modify])

    @movie.title = params[:title]
    @movie.description = params[:description]
    @movie.favorite = params[:favorite]

    save_status = @movie.save

    if save_status == true
      redirect_to("/movies/#{@movie.id}", :notice => "Movie updated successfully.")
    else
      render("movie_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @movie = Movie.find(params[:id_to_remove])

    @movie.destroy

    redirect_to("/movies", :notice => "Movie deleted successfully.")
  end
end
