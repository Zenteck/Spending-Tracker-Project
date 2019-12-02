require_relative('../models/budget.rb')

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
