# This controller is for all the CRUD operations related to a User.

MyApp.get "/users/new" do 
  erb :"/users/new_user_form" 
end

MyApp.post "/users/create" do
  @user = User.new
  @user.first_name = params["first_name"]
  @user.last_name = params["last_name"]
  @user.email = params["email"]
  @user.password = params["password"]
  @user.save
  redirect "/users"
end

MyApp.get "/users" do
  @users = User.all
  erb :"/users/users_list"
end

MyApp.get "/users/:id/edit" do
  @user = User.find_by_id(params[:id])
  erb :"/users/edit_user_form"
end

MyApp.post "/users/:id/update" do
  @user = User.find_by_id(params[:id])
  @user.first_name = params["first_name"]
  @user.last_name = params["last_name"]
  @user.email = params["email"]
  @user.password = params["password"]
  @user.save
  redirect "/users"
end

MyApp.post "/users/:id/delete" do
  @user = User.find_by_id(params[:id])
  @user.delete 
  redirect "/users"
end