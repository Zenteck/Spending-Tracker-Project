require_relative('../models/tag.rb')


#index
get '/tags' do
  @tags = Tag.all()
  erb(:"tags/index")
end
