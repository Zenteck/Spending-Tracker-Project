require_relative('../db/sql_runner.rb')
require_relative('./merchant.rb')
require_relative('./tag.rb')

class Transaction
  attr_reader :id
  attr_accessor :merchant_id, :tag_id, :amount

  def initialize(info)
    @id = info['id'].to_i if info['id']
    @merchant_id = info['merchant_id'].to_i
    @tag_id = info['tag_id'].to_i
    @amount = info['amount'].to_f
    @epoch = info['epoch'].to_i
  end

  # Which needs brackets with a single value? this or update?
  # CREATE
  def save
    sql = "INSERT INTO transactions
        (merchant_id, tag_id, amount, epoch)
        VALUES ($1, $2, $3, $4)
        RETURNING id"
    values = [@merchant_id, @tag_id, @amount, @epoch]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  # READ
  def self.all
    sql = 'SELECT * FROM transactions'
    transactions = SqlRunner.run(sql)
    transactions.map { |transaction| Transaction.new(transaction) }
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
    total
  end

  def time()
    return Time.at(@epoch)
  end

  # UPDATE
  def update
    sql = "UPDATE transactions SET
        (merchant_id, tag_id, amount, epoch)
        = ($1, $2, $3, $4) WHERE id = $5"
    values = [@merchant_id, @tag_id, @amount, @epoch, @id]
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
end
