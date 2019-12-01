require_relative('../models/budget.rb')

#index
#New
#Create/save
#show


#edit
get '/budget/:id/edit' do
  id = params[:id].to_i()
  @budget = Budget.find(id)
  erb(:"budget/edit")
end

#update
post '/budget/:id' do
  budget = Budget.new(params)
  budget.update()
  redirect '/transactions'
end
