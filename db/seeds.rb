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
