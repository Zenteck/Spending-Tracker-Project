require_relative( "../models/merchant.rb" )
require_relative( "../models/tag.rb" )
require_relative( "../models/transaction.rb" )
require_relative( "../models/budget.rb" )
require('time')
require("pry")

Budget.delete_all()
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

merchant4 = Merchant.new(
  {
    'name' => 'Woolworths'
  }
)
merchant4.save()

merchant5 = Merchant.new(
  {
    'name' => 'Maplin'
  }
)
merchant5.save()

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

tag4 = Tag.new(
  {
    'type' => 'random junk'
  }
)
tag4.save()

tag5 = Tag.new(
  {
    'type' => 'overpriced  tech'
  }
)
tag5.save()


# TRANSACTIONS
transaction1 = Transaction.new(
  {
    'merchant_id' => merchant1.id(),
    'tag_id'      => tag2.id(),
    'amount'      => 30.00,
    'time_log'         => Time.parse("2019-10-03T23:58")
  }
)
# [sec,min,hour,day,month,year,wday,yday,isdst,zone]
transaction1.save()

transaction2 = Transaction.new(
  {
    'merchant_id' => merchant2.id(),
    'tag_id'      => tag3.id(),
    'amount'      => 45.60,
    'time_log'         => Time.parse("2019-11-07T12:42")
  }
)
transaction2.save()

transaction3 = Transaction.new(
  {
    'merchant_id' => merchant3.id(),
    'tag_id'      => tag1.id(),
    'amount'      => 17.50,
    'time_log'         => Time.parse("2019-10-03T21:31")
  }
)
transaction3.save()

transaction4 = Transaction.new(
  {
    'merchant_id' => merchant4.id(),
    'tag_id'      => tag4.id(),
    'amount'      => 4.50,
    'time_log'         => Time.parse("2019-08-12T10:15")
  }
)
transaction4.save()

transaction5 = Transaction.new(
  {
    'merchant_id' => merchant5.id(),
    'tag_id'      => tag5.id(),
    'amount'      => 17.50,
    'time_log'         => Time.parse("2019-09-22T14:52")
  }
)
transaction5.save()

budget1 = Budget.new(
  {
    'budget' => '10.00'
  }

)
budget1.save


binding.pry

nil
