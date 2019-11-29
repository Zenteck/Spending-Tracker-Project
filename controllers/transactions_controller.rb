require_relative('../models/transaction.rb')
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')

#index
get '/transactions' do
  @transactions = Transaction.all()
  @merchants = Merchant.all()
  @Tags = Tag.all()
  erb(:"transactions/index")
end

#Create
get '/transactions/new' do
  erb(:"transactions/new")
end

#Save
post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save()
  redirect to('/transactions/thanks')
end


get '/transactions/thanks' do
erb(:"transactions/confirmation")
end
