require_relative('../db/sql_runner.rb')
require_relative('./merchant.rb')
require_relative('./tag.rb')
require('time')

class Transaction
  attr_reader :id
  attr_accessor :merchant_id, :tag_id, :amount, :time_log

  def initialize(info)
    @id = info['id'].to_i if info['id']
    @merchant_id = info['merchant_id'].to_i
    @tag_id = info['tag_id'].to_i
    @amount = info['amount'].to_f
    @time_log = info['time_log'].to_i
  end

  # CREATE
  def save
    sql = "INSERT INTO transactions
        (merchant_id, tag_id, amount, time_log)
        VALUES ($1, $2, $3, $4)
        RETURNING id"
    values = [@merchant_id, @tag_id, @amount, @time_log]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  # READ
  def self.all
    sql = 'SELECT * FROM transactions'
    transactions = SqlRunner.run(sql)
    return transactions.map { |transaction| Transaction.new(transaction) }
  end

  def self.sort_time_log
    return self.all.sort_by{ |transaction| transaction.time_log}.reverse
  end

  def self.find(id)
    sql = 'SELECT * FROM transactions WHERE id = $1'
    values = [id]
    transaction = SqlRunner.run(sql, values)[0]
    Transaction.new(transaction)
  end

  def self.total_spend
    sql = 'SELECT * FROM transactions'
    transactions = SqlRunner.run(sql)
    spending_array = transactions.map { |transaction| Transaction.new(transaction).amount }
    total = 0
    spending_array.each { |spend| total += spend }
    return total
  end

  # UPDATE
  def update
    sql = "UPDATE transactions SET
        (merchant_id, tag_id, amount, time_log)
        = ($1, $2, $3, $4) WHERE id = $5"
    values = [@merchant_id, @tag_id, @amount, @time_log, @id]
    SqlRunner.run(sql, values)
  end

  # DELETE
  def delete
    sql = 'DELETE FROM transactions WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = 'DELETE FROM transactions'
    SqlRunner.run(sql)
  end

  #Filters
  def self.filter_month(month)
    sql = "SELECT * FROM transactions"
    transactions = SqlRunner.run(sql)
    transaction_array = transactions.map{|transaction|Transaction.new(transaction)}
    return transaction_array.select!{|transaction|Time.at(transaction.time_log).month == month}
  end

  def self.filter_tag(tag_id)
    sql = "SELECT * FROM transactions WHERE tag_id = $1"
    values = [tag_id]
    transactions = SqlRunner.run(sql, values)
    return transaction_array = transactions.map{|transaction|Transaction.new(transaction)}
  end

  def self.filter_merchant(merchant_id)
    sql = "SELECT * FROM transactions WHERE merchant_id = $1"
    values = [merchant_id]
    transactions = SqlRunner.run(sql, values)
    return transaction_array = transactions.map{|transaction|Transaction.new(transaction)}
  end

  def self.filter_spend(filtered_transactions)
    spending_array = filtered_transactions.map{|transaction| transaction.amount}
    total = 0
    spending_array.each{|spend| total += spend}
    return total
  end

  #
  # def self.filter_merchant2(transaction_array, merchant_id)
  #   return transaction_array.select!{|transaction| transaction.merchant_id == merchant_id}
  # end

  #Timestamps
  def time()
    return Time.at(@time_log)
  end

  def html_time()
    return Time.at(@time_log).to_s.sub(' ','T').slice(0..15)
    # chomp(':00 +0100').chomp(':00 +0000')
  end

  def nice_timestamp
    return Time.at(@time_log).strftime("%A %d %B at %H:%M")
  end

end
