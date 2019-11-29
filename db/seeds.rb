require_relative( "../models/merchants.rb" )
require_relative( "../models/tags.rb" )
require_relative( "../models/transactions.rb" )
require("pry")

Transaction.delete_all()
Tag.delete_all()
Merchant.delete_all()


# MERCHANTS
merchant1 = Merchant.new(
  {
    'name' => 'BHS'
  }
)
merchant1.save

merchant2 = Merchant.new(
  {
    'name' => "Toys R Us"
  }
)
merchant2.save

merchant3 = Merchant.new(
  {
    'name' => 'Jamies Italian'
  }
)
merchant3.save


#TAGS
tag1 = Tag.new(
  {
    'type' => 'restaurants'
  }
)
tag1.save()

tag2 = Tag.new(
  {
    'type' => 'clothing'
  }
)
tag2.save()

tag3 = Tag.new(
  {
    'type' => 'toys and games'
  }
)
tag3.save()


# TRANSACTIONS
transaction1 = Transaction.new(
  {
    'merchant_id' => merchant1.id(),
    'tag_id'      => tag2.id,
    'amount'      => 30.00
  }
)
transaction1.save()

transaction2 = Transaction.new(
  {
    'merchant_id' => merchant2.id(),
    'tag_id'      => tag3.id,
    'amount'      => 45.60
  }
)
transaction2.save()

transaction3 = Transaction.new(
  {
    'merchant_id' => merchant3.id(),
    'tag_id'      => tag1.id,
    'amount'      => 17.50
  }
)
transaction3.save()


binding.pry

nil
