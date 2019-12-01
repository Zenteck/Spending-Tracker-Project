require_relative( "../models/merchant.rb" )
require_relative( "../models/tag.rb" )
require_relative( "../models/transaction.rb" )
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
    'tag_id'      => tag2.id(),
    'amount'      => 30.00,
    'top'         => Time.parse("2019-10-03T23:58")
  }
)
# [sec,min,hour,day,month,year,wday,yday,isdst,zone]
transaction1.save()

transaction2 = Transaction.new(
  {
    'merchant_id' => merchant2.id(),
    'tag_id'      => tag3.id(),
    'amount'      => 45.60,
    'top'         => Time.parse("2019-11-07T12:42")
  }
)
transaction2.save()

transaction3 = Transaction.new(
  {
    'merchant_id' => merchant3.id(),
    'tag_id'      => tag1.id(),
    'amount'      => 17.50,
    'top'         => Time.parse("2019-10-03T21:31")
  }
)
transaction3.save()


binding.pry

nil
