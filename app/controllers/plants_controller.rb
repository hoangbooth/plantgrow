class PlantsController < ApplicationController
  def index
    matching_plants = Plant.all

    @list_of_plants = matching_plants.order({ :created_at => :desc })

    render({ :template => "plants/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_plants = Plant.where({ :id => the_id })

    @the_plant = matching_plants.at(0)

    render({ :template => "plants/show.html.erb" })
  end

  def create
    the_plant = Plant.new
    the_plant.species_id = params.fetch("query_species_id")
    the_plant.owner_id = params.fetch("query_owner_id")
    the_plant.dead = params.fetch("query_dead", false)
    the_plant.room_id = params.fetch("query_room_id")
    the_plant.name = params.fetch("query_name")
    the_plant.water_interval = params.fetch("query_water_interval")
    the_plant.water_next_at = params.fetch("query_water_next_at")
    the_plant.likes_count = params.fetch("query_likes_count")
    the_plant.plantphotos_count = params.fetch("query_plantphotos_count")
    the_plant.activities_count = params.fetch("query_activities_count")

    if the_plant.valid?
      the_plant.save
      redirect_to("/plants", { :notice => "Plant created successfully." })
    else
      redirect_to("/plants", { :alert => the_plant.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_plant = Plant.where({ :id => the_id }).at(0)

    the_plant.species_id = params.fetch("query_species_id")
    the_plant.owner_id = params.fetch("query_owner_id")
    the_plant.dead = params.fetch("query_dead", false)
    the_plant.room_id = params.fetch("query_room_id")
    the_plant.name = params.fetch("query_name")
    the_plant.water_interval = params.fetch("query_water_interval")
    the_plant.water_next_at = params.fetch("query_water_next_at")
    the_plant.likes_count = params.fetch("query_likes_count")
    the_plant.plantphotos_count = params.fetch("query_plantphotos_count")
    the_plant.activities_count = params.fetch("query_activities_count")

    if the_plant.valid?
      the_plant.save
      redirect_to("/plants/#{the_plant.id}", { :notice => "Plant updated successfully."} )
    else
      redirect_to("/plants/#{the_plant.id}", { :alert => the_plant.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_plant = Plant.where({ :id => the_id }).at(0)

    the_plant.destroy

    redirect_to("/plants", { :notice => "Plant deleted successfully."} )
  end
end
