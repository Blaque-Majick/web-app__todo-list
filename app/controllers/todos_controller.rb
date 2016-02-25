# This controller is for all the CRUD operations related to a Todo.
MyApp.before "/todos*" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user == nil
      redirect "/logins/new" 
    end
end

MyApp.get "/todos/new" do
  @users = User.all
  @priorities = Priority.all
  erb :"/todos/new_todo_form"
end

MyApp.post "/todos/create" do
  @todo = Todo.new
  @todo.title = params["title"]
  @todo.description = params["description"]
  @todo.user_id = params["user_id"]
  @todo.priority_id = params["priority_id"]
  @todo.completed = false
  @todo.save
  redirect "/todos"
end

MyApp.get "/todos" do
  @todos = Todo.all
  erb :"/todos/todos_list"
end

MyApp.get "/todos/:id/edit" do
  @todo = Todo.find_by_id(params[:id])
  erb :"todos/edit_todo_form"
end

MyApp.post "/todos/:id/update" do
  @todo = Todo.find_by_id(params[:id])
  @todo.title = params["title"]
  @todo.description = params["description"]
  @todo.save
  erb :"/todos/update_success"
end

MyApp.post "/todos/:id/delete" do
  @todo = Todo.find_by_id(params[:id])
  @todo.delete
  redirect "/todos"
end

MyApp.get "/todo_page/:todo_id" do
  @todo = Todo.find_by_id(params[:todo_id])
  erb :"/todos/todo_page"
end