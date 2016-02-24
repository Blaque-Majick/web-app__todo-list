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
