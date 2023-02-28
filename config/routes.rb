Rails.application.routes.draw do

  get("/", { :controller => "application", :action => "index" })

  # Routes for the Like resource:

  # CREATE
  post("/insert_like", { :controller => "likes", :action => "create" })
          
  # READ
  get("/likes", { :controller => "likes", :action => "index" })
  
  get("/likes/:path_id", { :controller => "likes", :action => "show" })
  
  # UPDATE
  
  post("/modify_like/:path_id", { :controller => "likes", :action => "update" })
  
  # DELETE
  get("/delete_like/:path_id", { :controller => "likes", :action => "destroy" })

  #------------------------------

  # Routes for the Room resource:

  # CREATE
  post("/insert_room", { :controller => "rooms", :action => "create" })
          
  # READ
  get("/rooms", { :controller => "rooms", :action => "index" })
  
  get("/rooms/:path_id", { :controller => "rooms", :action => "show" })
  
  # UPDATE
  
  post("/modify_room/:path_id", { :controller => "rooms", :action => "update" })
  
  # DELETE
  get("/delete_room/:path_id", { :controller => "rooms", :action => "destroy" })

  #------------------------------

  # Routes for the Activity resource:

  # CREATE
  post("/insert_activity", { :controller => "activities", :action => "create" })
          
  # READ
  get("/activities", { :controller => "activities", :action => "index" })
  
  get("/activities/:path_id", { :controller => "activities", :action => "show" })
  
  # UPDATE
  
  post("/modify_activity/:path_id", { :controller => "activities", :action => "update" })
  
  # DELETE
  get("/delete_activity/:path_id", { :controller => "activities", :action => "destroy" })

  #------------------------------

  # Routes for the Plant resource:

  # CREATE
  post("/insert_plant", { :controller => "plants", :action => "create" })
          
  # READ
  get("/plants", { :controller => "plants", :action => "index" })
  
  get("/plants/:path_id", { :controller => "plants", :action => "show" })
  
  # UPDATE
  
  post("/modify_plant/:path_id", { :controller => "plants", :action => "update" })
  
  # DELETE
  get("/delete_plant/:path_id", { :controller => "plants", :action => "destroy" })


  #------------------------------

  # Routes for the Plantphoto resource:

  # CREATE
  post("/insert_plantphoto", { :controller => "plantphotos", :action => "create" })
          
  # READ
  get("/plantphotos", { :controller => "plantphotos", :action => "index" })
  
  get("/plantphotos/:path_id", { :controller => "plantphotos", :action => "show" })
  
  # UPDATE
  
  post("/modify_plantphoto/:path_id", { :controller => "plantphotos", :action => "update" })
  
  # DELETE
  get("/delete_plantphoto/:path_id", { :controller => "plantphotos", :action => "destroy" })

  #------------------------------

  # Routes for the Follow request resource:

  # CREATE
  post("/insert_follow_request", { :controller => "follow_requests", :action => "create" })
          
  # READ
  get("/follow_requests", { :controller => "follow_requests", :action => "index" })
  
  get("/follow_requests/:path_id", { :controller => "follow_requests", :action => "show" })
  
  # UPDATE
  
  post("/modify_follow_request/:path_id", { :controller => "follow_requests", :action => "update" })
  
  # DELETE
  get("/delete_follow_request/:path_id", { :controller => "follow_requests", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Species resource:

  # CREATE
  post("/insert_species", { :controller => "species", :action => "create" })
          
  # READ
  get("/species", { :controller => "species", :action => "index" })
  
  get("/species/:path_id", { :controller => "species", :action => "show" })
  
  # UPDATE
  
  post("/modify_species/:path_id", { :controller => "species", :action => "update" })
  
  # DELETE
  get("/delete_species/:path_id", { :controller => "species", :action => "destroy" })

  #------------------------------

end
