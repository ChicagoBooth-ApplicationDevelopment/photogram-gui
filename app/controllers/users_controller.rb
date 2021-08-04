class UsersController < ApplicationController
  def index
    matching_users = User.all
    
    @list_of_users = matching_users.order({ :username => :asc })
    
    render({ :template => "user_templates/index.html.erb"})
  end

  def show
    #Parameters: {"path_username"=>"anisa"}

    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username})

    @the_user = matching_usernames.at(0)

    # if the_user == nil
    #   redirect_to("/404")
    # else
    render({ :template => "user_templates/show.html.erb"})
    # end
  end

  def create
    #Parameters: {"query_user"=>"susie"}

    input_user = params.fetch("query_user")

    a_new_user = User.new
    a_new_user.username = input_user

    a_new_user.save

    #render({ :template => "user_templates/create.html.erb"})
    redirect_to("/users/" + a_new_user.username)
  end

  def update
    #Parameters: {"path_username"=>"susie"}
    the_username = params.fetch("modify_user")
    matching_user = User.where({ :username => the_username})
    the_user = matching_user.at(0)

    input_user = params.fetch("query_user")

    the_user.username = input_user

    the_user.save

    #render({ :template => "user_templates/update.html.erb"})
    redirect_to("/users/" + the_user.username.to_s)
  end
end