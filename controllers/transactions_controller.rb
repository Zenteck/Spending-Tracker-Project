require_relative('../models/transaction.rb')

#index
get '/transactions' do
  @transactions = Transaction.all()
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
