class RatingsController < ApplicationController
  def index
    matching_ratings = Rating.all

    @list_of_ratings = matching_ratings.order({ :created_at => :desc })

    render({ :template => "ratings/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_ratings = Rating.where({ :id => the_id })

    @the_rating = matching_ratings.at(0)

    render({ :template => "ratings/show.html.erb" })
  end

  def create
    the_rating = Rating.new
    the_rating.user_id = params.fetch("query_user_id")
    the_rating.restroom_id = params.fetch("query_restroom_id")
    the_rating.score = params.fetch("query_score")
    the_rating.review_notes = params.fetch("query_review_notes")
    the_rating.name = params.fetch("query_name")
    the_rating.location = params.fetch("query_location")

    if the_rating.valid?
      the_rating.save
      redirect_to("/ratings", { :notice => "Rating created successfully." })
    else
      redirect_to("/ratings", { :notice => "Rating failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_rating = Rating.where({ :id => the_id }).at(0)

    the_rating.user_id = params.fetch("query_user_id")
    the_rating.restroom_id = params.fetch("query_restroom_id")
    the_rating.score = params.fetch("query_score")
    the_rating.review_notes = params.fetch("query_review_notes")
    the_rating.name = params.fetch("query_name")
    the_rating.location = params.fetch("query_location")

    if the_rating.valid?
      the_rating.save
      redirect_to("/ratings/#{the_rating.id}", { :notice => "Rating updated successfully."} )
    else
      redirect_to("/ratings/#{the_rating.id}", { :alert => "Rating failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_rating = Rating.where({ :id => the_id }).at(0)

    the_rating.destroy

    redirect_to("/ratings", { :notice => "Rating deleted successfully."} )
  end
end
