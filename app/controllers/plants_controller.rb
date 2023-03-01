class PlantsController < ApplicationController
  before_action(:force_user_sign_in)
  
  
  def index
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
    the_plant.owner_id = @current_user.id
    
    if params.has_key?("query_room_id")
      the_plant.room_id = params["query_room_id"]
    else
      new_room = Room.new
      new_room.roomtype = "Unknown Room"
      new_room.roomname = "Unnamed Room"
      new_room.owner_id = @current_user.id
      new_room.save
      the_plant.room_id = new_room.id
    
    end
    
    if params.fetch("query_name").blank?
      the_plant.name = the_plant.species.binoname
    else
      the_plant.name = params.fetch("query_name")
    end

    # the_plant.water_interval = params.fetch("query_water_interval")
    # the_plant.water_next_at = params.fetch("query_water_next_at")
    # the_plant.likes_count = params.fetch("query_likes_count")
    # the_plant.plantphotos_count = params.fetch("query_plantphotos_count")
    # the_plant.activities_count = params.fetch("query_activities_count")
     the_plant.dead = params.fetch("query_dead", false)

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
    
    the_plant.name = params.fetch("query_name")
    the_plant.species_id = params.fetch("query_species_id")
    the_plant.owner_id = @current_user.id
    the_plant.dead = params.fetch("query_dead", false)
    the_plant.room_id = params.fetch("query_room_id")

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
