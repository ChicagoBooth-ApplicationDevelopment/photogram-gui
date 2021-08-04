Rails.application.routes.draw do

  get("/users", { :controller => "users", :action => "index"})

  get("/", { :controller => "users", :action => "index"})

  get("/users/:path_username", { :controller => "users", :action => "show"})

  get("/photos", { :controller => "photos", :action => "index"})

  get("/photos/:path_id", { :controller => "photos", :action => "show"})

  get("/delete_photo/:toast_id", { :controller => "photos", :action => "bye"})

  get("/insert_photo", { :controller => "photos", :action => "create"})

  get("/update_photo/:modify_id", { :controller => "photos", :action => "update"})

  get("/insert_user", { :controller => "users", :action => "create"})

  get("/update_user/:modify_user", { :controller => "users", :action => "update"})

  get("/insert_comment", { :controller => "photos", :action => "add_comment"})

end
