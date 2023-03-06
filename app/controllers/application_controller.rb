class ApplicationController < ActionController::Base
  before_action(:load_current_user)
  before_action(:load_room_type)
  before_action(:load_activity_type)
  before_action(:load_all_plants)
  # Uncomment line 5 in this file and line 3 in UserAuthenticationController if you want to force users to sign in before any other actions.
  before_action(:force_user_sign_in)
  
  def load_current_user
    the_id = session[:user_id]
    
    @current_user = User.where({ :id => the_id }).first
  end
  
  def load_room_type
    @room_type = Array.new
    @room_type = ["Balcony", "Bathroom", "Bedroom", "Dining Room", "Hall", "Kitchen", "Unknown Room"]
  end

  def load_activity_type
    @activity_type = Array.new
    @activity_type = ["Water", "Fertilize", "Repot", "Mist", "Rotate", "Notes"]
    @activity_type_home = ["Water", "Fertilize", "Repot", "Mist", "Rotate"]
  end

  def load_all_plants
    if @current_user != nil

      matching_plants = @current_user.own_plants
      # matching_plants = Plant.all

      #Living Plant
      @list_of_plants = matching_plants.where({ :dead => "false" }).order({ :created_at => :desc })

      #Dead Plant
      @list_of_dead_plants = matching_plants.where({ :dead => "true" }).order({ :created_at => :desc })
    end
  end

  def force_user_sign_in
    if @current_user == nil
      redirect_to("/user_sign_in", { :notice => "You have to sign in first." })
    end
  end

  def check_admin
    if @current_user.id != 1
      redirect_to("/", { :alert => "You dont have permission to access this page" })
    end


end




end
