require('sinatra')
require('sinatra/contrib/all')
require_relative('./controllers/transaction_controller')
# require_relative('controllers/merchants_controller')
# require_relative('controllers/tags_controller')

get '/' do
  erb(:index)
end
