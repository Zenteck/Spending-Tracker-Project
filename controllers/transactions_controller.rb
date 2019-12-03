require_relative('../models/transaction.rb')
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')

#index
get '/transactions' do
  @tags = Tag.all()
  @merchants = Merchant.all()
  @transactions = Transaction.sort_top()
  erb(:"transactions/index")
end

post '/transactions/month' do
  month = params['month'].to_i()
  @tags = Tag.all()
  @merchants = Merchant.all()
  @transactions = Transaction.filter_month(month)
  erb(:"transactions/index")
end

post '/transactions/tag' do
  tag_id = params['tag_id'].to_i()
  @tags = Tag.all()
  @merchants = Merchant.all()
  @transactions = Transaction.filter_tag(tag_id)
  erb(:"transactions/index")
end

post '/transactions/merchant' do
  merchant_id = params['merchant_id'].to_i()
  @tags = Tag.all()
  @merchants = Merchant.all()
  @transactions = Transaction.filter_merchant(merchant_id)
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
  params['top'] = Time.parse(params['top'])
  transaction = Transaction.new(params)
  transaction.save()
  redirect to('/transactions/thanks')
end

get '/transactions/thanks' do
erb(:"transactions/confirmation")
end

#show
get '/transactions/:id' do
  id = params[:id].to_i()
  @transaction = Transaction.find(id)
  erb(:"transactions/show")
end

#delete
post '/transactions/:id/delete' do
  id = params[:id].to_i()
  transaction = Transaction.find(id)
  transaction.delete()
  erb(:"transactions/deleted")
end

#edit
get '/transactions/:id/edit' do
  id = params[:id].to_i()
  @transaction = Transaction.find(id)
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb(:"transactions/edit")
end

#update
post '/transactions/:id' do
  params['top'] = Time.parse(params['top'])
  transaction = Transaction.new(params)
  transaction.update()
  redirect '/transactions'
end
