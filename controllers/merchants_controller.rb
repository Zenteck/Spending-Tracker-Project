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

#Create
post '/merchants' do
  merchant = Merchant.new(params)
  merchant.save()
  redirect "/merchants"
end
