require_relative('../db/sql_runner')

class Merchant
  attr_reader :id
  attr_accessor :name

  def initialize(info)
    @id = info['id'].to_i if info['id']
    @name = info['name']
  end

  # CREATE
  def save()
    sql = "INSERT INTO merchants
    (name) VALUES ($1)
    RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  # READ
  def self.all()
    sql = 'SELECT * FROM merchants'
    merchants = SqlRunner.run(sql)
    merchants.map { |merchant| Merchant.new(merchant) }
  end

  def self.find(id)
    sql = 'SELECT * FROM merchants WHERE id = $1'
    values = [id]
    merchant = SqlRunner.run(sql, values)[0]
    return Merchant.new(merchant)
  end

  # UPDATE
  def update()
    sql = 'UPDATE merchants SET name = $1 WHERE id = $2'
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  # DELETE
  def delete()
    sql = 'DELETE FROM merchants WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = 'DELETE FROM merchants'
    SqlRunner.run(sql)
  end
end
