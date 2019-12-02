require_relative('../models/budget.rb')
require('pry')

#index
#New
#Create/save
#show
#none of these are really needed.

#edit
get '/budget/edit' do
  @budget = Budget.find()
  erb(:"budget/edit")
end

#update
post '/budget/edit' do
  new_budget = Budget.new(params)
  Budget.update(new_budget)
  redirect '/'
end
