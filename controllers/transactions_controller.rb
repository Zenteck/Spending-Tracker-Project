require_relative('../models/transaction.rb')
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')

#index
get '/transactions' do
  @transactions = Transaction.all()
  erb(:"transactions/index")
end

#New
get '/transactions/new' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb(:"transactions/new")
end

#Save
post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save()
  redirect to('/transactions/thanks')
end

#show

#delete

#edit
#update
get '/transactions/thanks' do
erb(:"transactions/confirmation")
end
