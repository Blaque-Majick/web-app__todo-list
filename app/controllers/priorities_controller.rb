MyApp.get "/priorities/new" do
  erb :"/priorities/new"
end

MyApp.post "/priorities/create" do
  @priority = Priority.new
  @priority.priority = params["priority"]
  @priority.save
  redirect "/"
end