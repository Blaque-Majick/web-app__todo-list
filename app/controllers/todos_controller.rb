# This controller is for all the CRUD operations related to a Todo.

MyApp.get "/new_todo_form" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      erb :"/todos/new_todo_form"
    else
      erb :"login_required"
    end
end

MyApp.post "/new_todo" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @todo = Todo.new
      @todo.title = params["title"]
      @todo.description = params["description"]
      @todo.done = false
      @todo.user_id = session["user_id"]
      @todo.save
      erb :"/todos/create_success"
    else
      erb :"login_required"
    end
end

MyApp.get "/todos_list" do
  @todos = Todo.all
  erb :"/todos/todos_list"
end

MyApp.get "/edit_todo_form/:todo_id" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @todo = Todo.find_by_id(params[:todo_id])
      erb :"todos/edit_todo_form"
    else
      erb :"login_required"
    end
end

MyApp.post "/edit_todo/:todo_id" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @todo = Todo.find_by_id(params[:todo_id])
      @todo.title = params["title"]
      @todo.description = params["description"]
      @todo.save
      erb :"/todos/update_success"
    else
      erb :"login_required"
    end
end

MyApp.post "/delete_todo/:todo_id" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @todo = Todo.find_by_id(params[:todo_id])
      @todo.delete
      erb :"/todos/delete_success"
    else
      erb :"login_required"
    end
end

MyApp.get "/todo_page/:todo_id" do
  @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      @todo = Todo.find_by_id(params[:todo_id])
      erb :"/todos/todo_page"
    else
      erb :"login_required"
    end
end

MyApp.post "/complete_todo/:todo_id" do
  @todos = Todo.all
  @todo = Todo.find_by_id(params[:todo_id])
  if @todo.done == nil || @todo.done == false
    @todo.done = true
  else
    @todo.done = false
  end
    @todo.save
    erb :"/todos/todos_list"
  end