class PlantphotosController < ApplicationController
  def index
    matching_plantphotos = Plantphoto.all

    @list_of_plantphotos = matching_plantphotos.order({ :created_at => :desc })

    render({ :template => "plantphotos/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_plantphotos = Plantphoto.where({ :id => the_id })

    @the_plantphoto = matching_plantphotos.at(0)

    render({ :template => "plantphotos/show.html.erb" })
  end

  def create
    the_plantphoto = Plantphoto.new
    the_plantphoto.image = params.fetch("query_image")
    the_plantphoto.caption = params.fetch("query_caption")
    the_plantphoto.plant_id = params.fetch("query_plant_id")
    the_plantphoto.owner_id = @current_user.id
  

    if the_plantphoto.valid?
      the_plantphoto.save
      redirect_to("/plants/" + the_plantphoto.plant_id.to_s, { :notice => "Plantphoto created successfully." })
    else
      redirect_to("/plants/" + the_plantphoto.plant_id.to_s, { :alert => the_plantphoto.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_plantphoto = Plantphoto.where({ :id => the_id }).at(0)

    the_plantphoto.image = params.fetch("query_image")
    the_plantphoto.caption = params.fetch("query_caption")
    the_plantphoto.plant_id = params.fetch("query_plant_id")
    the_plantphoto.owner_id = params.fetch("query_owner_id")
    the_plantphoto.cover = params.fetch("query_cover", false)

    if the_plantphoto.valid?
      the_plantphoto.save
      redirect_to("/plantphotos/#{the_plantphoto.id}", { :notice => "Plantphoto updated successfully."} )
    else
      redirect_to("/plantphotos/#{the_plantphoto.id}", { :alert => the_plantphoto.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_plantphoto = Plantphoto.where({ :id => the_id }).at(0)

    the_plantphoto.destroy

    redirect_to("/plants/" + the_plantphoto.plant.id.to_s, { :notice => "Plantphoto deleted successfully."} )
  end
end
