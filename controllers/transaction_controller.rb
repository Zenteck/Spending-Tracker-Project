require_relative('../models/transactions')

#index
get '/transactions' do
  @transactions = Transaction.all()
  erb(:"transactions/index")
end
