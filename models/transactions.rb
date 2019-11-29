require_relative('../db/sql_runner.rb')
require_relative('./merchants.rb')
require_relative('./tags.rb')

class Transaction

  attr_reader :id
  attr_accessor :merchant_id, :tag_id, :amount

      def initialize(info)
        @id = info['id'].to_i() if options['id']
        @merchant_id = info['merchant_id'].to_i()
        @tag_id = inf0['tag_id'].to_i()
        @amount = info['amount'].to_f()
      end

    #Which needs brackets with a single value? this or update?
    #CREATE
      def save()
        sql = "INSERT INTO transactions
        (merchant_id, tag_id, amount)
        VALUES ($1, $2, $3)
        RETURNING id"
        values = [@merchant_id, @tag_id, @amount]
        result = SqlRunner.run(sql, values)
        @id = results[0]['id'].to_i()
      end

    #READ
      def self.all()
        sql = "SELECT * FROM transactions"
        transactions = SqlRunner.run(sql)
        return transactions.map{|transaction| Transaction.new(transaction)}
      end

    #UPDATE
      def update()
        sql = "UPDATE transactions SET
        (merchant_id, tag_id, amount)
        = (s1, $2, $3) WHERE id = $4"
        values = [@merchant_id, @tag_id, @amount, @id]
        SqlRunner.run(sql, values)
      end

    #DELETE
      def delete()
        sql = "DELETE FROM transactions WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
      end

      def self.delete_all()
        sql = "DELTE FROM transactions"
        SqlRunner.run(sql)
      end

end
