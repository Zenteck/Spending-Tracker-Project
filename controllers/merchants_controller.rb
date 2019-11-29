require_relative('../models/merchant.rb')


#index
get '/merchants' do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end
