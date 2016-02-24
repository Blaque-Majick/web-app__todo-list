# This controller is for all the CRUD operations related to a User.

MyApp.get "/new_user_form" do 
  erb :"/users/new_user_form" 
end

MyApp.post "/new_user" do
  @user = User.new
  @user.first_name = params["first_name"]
  @user.last_name = params["last_name"]
  @user.email = params["email"]
  @user.password = params["password"]
  @user.save
  erb :"/users/create_success"
end

MyApp.get "/users_list" do
  @users = User.all
  erb :"/users/users_list"
end

MyApp.get "/edit_user_form/:user_id" do
  @user = User.find_by_id(params[:user_id])
  erb :"/users/edit_user_form"
end

MyApp.post "/update_user/:user_id" do
  @user = User.find_by_id(params[:user_id])
  @user.first_name = params["first_name"]
  @user.last_name = params["last_name"]
  @user.email = params["email"]
  @user.password = params["password"]
  @user.save
  erb :"/users/update_success"
end

MyApp.post "/delete_user/:user_id" do
  @user = User.find_by_id(params[:user_id])
  @user.delete 
  erb :"/users/delete_success"
end