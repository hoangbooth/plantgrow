class SpeciesController < ApplicationController
  before_action(:force_user_sign_in)
  before_action(:check_admin)

  def index

    matching_species = Species.all

    @list_of_species = matching_species.order({ :created_at => :desc })

    render({ :template => "species/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_species = Species.where({ :id => the_id })

    @the_species = matching_species.at(0)

    render({ :template => "species/show.html.erb" })
  end

  def create
    the_species = Species.new
    the_species.nickname = params.fetch("query_nickname")
    the_species.cover = params.fetch("query_cover")
    the_species.location = params.fetch("query_location")
    the_species.binoname = params.fetch("query_binoname")
    the_species.difficulty = params.fetch("query_difficulty")
    the_species.water_type = params.fetch("query_water_type")
    the_species.sun_type = params.fetch("query_sun_type")
    the_species.about = params.fetch("query_about")
    the_species.instruction = params.fetch("query_instruction")
    the_species.pet_friendly = params.fetch("query_pet_friendly", false)

    if the_species.valid?
      the_species.save
      redirect_to("/species", { :notice => "Species created successfully." })
    else
      redirect_to("/species", { :alert => the_species.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_species = Species.where({ :id => the_id }).at(0)

    the_species.nickname = params.fetch("query_nickname")
    the_species.cover = params.fetch("query_cover")
    the_species.location = params.fetch("query_location")
    the_species.binoname = params.fetch("query_binoname")
    the_species.difficulty = params.fetch("query_difficulty")
    the_species.water_type = params.fetch("query_water_type")
    the_species.sun_type = params.fetch("query_sun_type")
    the_species.about = params.fetch("query_about")
    the_species.instruction = params.fetch("query_instruction")
    the_species.pet_friendly = params.fetch("query_pet_friendly", false)

    if the_species.valid?
      the_species.save
      redirect_to("/species/#{the_species.id}", { :notice => "Species updated successfully."} )
    else
      redirect_to("/species/#{the_species.id}", { :alert => the_species.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_species = Species.where({ :id => the_id }).at(0)

    the_species.destroy

    redirect_to("/species", { :notice => "Species deleted successfully."} )
  end
end
