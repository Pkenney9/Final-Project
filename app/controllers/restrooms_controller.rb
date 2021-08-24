class RestroomsController < ApplicationController
  def index
    matching_restrooms = Restroom.all

    @list_of_restrooms = matching_restrooms.order({ :created_at => :desc })

    render({ :template => "restrooms/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_restrooms = Restroom.where({ :id => the_id })

    @the_restroom = matching_restrooms.at(0)

    render({ :template => "restrooms/show.html.erb" })
  end

  def create
    the_restroom = Restroom.new
    the_restroom.name = params.fetch("query_name")
    the_restroom.location = params.fetch("query_location")
    the_restroom.score = params.fetch("query_score")
    the_restroom.review_notes = params.fetch("query_review_notes")

    if the_restroom.valid?
      the_restroom.save
      redirect_to("/restrooms", { :notice => "Restroom created successfully." })
    else
      redirect_to("/restrooms", { :notice => "Restroom failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_restroom = Restroom.where({ :id => the_id }).at(0)

    the_restroom.name = params.fetch("query_name")
    the_restroom.location = params.fetch("query_location")
    the_restroom.score = params.fetch("query_score")
    the_restroom.review_notes = params.fetch("query_review_notes")

    if the_restroom.valid?
      the_restroom.save
      redirect_to("/restrooms/#{the_restroom.id}", { :notice => "Restroom updated successfully."} )
    else
      redirect_to("/restrooms/#{the_restroom.id}", { :alert => "Restroom failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_restroom = Restroom.where({ :id => the_id }).at(0)

    the_restroom.destroy

    redirect_to("/restrooms", { :notice => "Restroom deleted successfully."} )
  end
end
