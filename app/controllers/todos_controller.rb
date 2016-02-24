# This controller is for all the CRUD operations related to a Todo.

MyApp.get "/new_todo_form" do
  erb :"/todos/new_todo_form"
end

MyApp.post "/new_todo" do
  @todo = Todo.new
  @todo.title = params["title"]
  @todo.description = params["description"]
  @todo.save
  erb :"/todos/create_success"
end

MyApp.get "/todos_list" do
  @todos = Todo.all
  erb :"/todos/todos_list"
end

MyApp.get "/edit_todo_form/:todo_id" do
  @todo = Todo.find_by_id(params[:todo_id])
  erb :"todos/edit_todo_form"
end

MyApp.post "/edit_todo/:todo_id" do
  @todo = Todo.find_by_id(params[:todo_id])
  @todo.title = params["title"]
  @todo.description = params["description"]
  @todo.save
  erb :"/todos/update_success"
end
