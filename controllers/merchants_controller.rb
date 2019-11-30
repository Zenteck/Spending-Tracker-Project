require_relative('../models/merchant.rb')


#index
get '/merchants' do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end

#New
get '/merchants/new' do
  erb(:"merchants/new")
end

#Create/save
post '/merchants' do
  merchant = Merchant.new(params)
  merchant.save()
  redirect "/merchants"
end

#show
get '/merchants/:id' do
  id = params[:id].to_i()
  @merchant = Merchant.find(id)
  erb(:"merchants/show")
end

#delete
post '/merchants/:id/delete' do
  id = params[:id].to_i()
  merchant = Merchant.find(id)
  merchant.delete()
  redirect '/merchants'
end

#edit
get '/merchants/:id/edit' do
  id = params[:id].to_i()
  @merchant = Merchant.find(id)
  erb(:"merchants/edit")
end

#update
post '/merchants/:id' do
  merchant = Merchant.new(params)
  merchant.update()
  redirect '/merchants'
end
