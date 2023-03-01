class ActivitiesController < ApplicationController
  before_action(:force_user_sign_in)


  def index
    if @current_user.id != 1
      redirect_to("/", { :alert => "You dont have permission to access this page" })
    else
      matching_activities = Activity.all

      @list_of_activities = matching_activities.order({ :created_at => :desc })

      render({ :template => "activities/index.html.erb" })
    end
  end

  def show
    the_id = params.fetch("path_id")

    matching_activities = Activity.where({ :id => the_id })

    @the_activity = matching_activities.at(0)

    render({ :template => "activities/show.html.erb" })
  end

  def create
    the_activity = Activity.new
    the_activity.care_type = params.fetch("query_care_type")
    the_activity.note = params.fetch("query_note")
    the_activity.plant_id = params.fetch("query_plant_id")
    
    if params.fetch("query_care_at").blank?
      the_activity.care_at = Time.now
    else
      the_activity.care_at = params.fetch("query_care_at")
    end
    
    the_activity.owner_id = @current_user.id

    if the_activity.valid?
      the_activity.save
      redirect_to("/plants/" + the_activity.plant_id.to_s, { :notice => "Activity created successfully." })
    else
      redirect_to("/plants/" + the_activity.plant_id.to_s, { :alert => the_activity.errors.full_messages.to_sentence })
    end
  end


  def bulk_create
    
    @list_of_plants.each do |a_plant|
      
      if params.has_key?(a_plant.id.to_s)

        the_activity = Activity.new
        the_activity.care_type = params.fetch("query_care_type")
        the_activity.plant_id = a_plant.id
        the_activity.care_at = Time.now
        the_activity.owner_id = @current_user.id
      # params.fetch("query_care_at")
        if the_activity.valid?
          the_activity.save
        else
          redirect_to("/", { :alert => the_activity.errors.full_messages.to_sentence })
        end
      end
    end

    redirect_to("/", { :notice => "Activity created successfully." })
  end


  def update
    the_id = params.fetch("path_id")
    the_activity = Activity.where({ :id => the_id }).at(0)

    the_activity.care_type = params.fetch("query_care_type")
    the_activity.note = params.fetch("query_note")
    the_activity.plant_id = params.fetch("query_plant_id")
    the_activity.care_at = params.fetch("query_care_at")
    the_activity.owner_id = params.fetch("query_owner_id")

    if the_activity.valid?
      the_activity.save
      redirect_to("/activities/#{the_activity.id}", { :notice => "Activity updated successfully."} )
    else
      redirect_to("/activities/#{the_activity.id}", { :alert => the_activity.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_activity = Activity.where({ :id => the_id }).at(0)

    the_activity.destroy

    redirect_to("/activities", { :notice => "Activity deleted successfully."} )
  end
end
