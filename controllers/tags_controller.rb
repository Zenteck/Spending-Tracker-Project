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
