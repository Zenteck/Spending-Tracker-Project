require_relative('../models/tag.rb')


#index
get '/tags' do
  @tags = Tag.all()
  erb(:"tags/index")
end

#new
get '/tags/new' do
  erb(:"tags/new")
end

#create
post '/tags' do
  tag = Tag.new(params)
  tag.save()
  redirect "/tags"
end

#show
get '/tags/:id' do
  id = params[:id].to_i()
  @tag = Tag.find(id)
  erb(:"tags/show")
end

#delete
post '/tags/:id/delete' do
  id = params[:id].to_i()
  tag = Tag.find(id)
  tag.delete()
  redirect '/tags'
end

#edit
get '/tags/:id/edit' do
  id = params[:id].to_i()
  @tag = Tag.find(id)
  erb(:"tags/edit")
end
#update
post '/tags/:id' do
  tag = Tag.new(params)
  tag.update()
  redirect '/tags'
end
