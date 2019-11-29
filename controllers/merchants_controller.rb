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

#delete

#edit
#update
