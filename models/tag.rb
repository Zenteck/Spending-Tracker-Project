require_relative('../db/sql_runner')

class Tag
  attr_reader :id
  attr_accessor :type

  def initialize(info)
    @id = info['id'].to_i if info['id']
    @type = info['type']
  end

  # CREATE
  def save
    sql = "INSERT INTO tags
    (type) VALUES ($1)
    RETURNING id"
    values = [@type]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  # READ
  def self.all
    sql = 'SELECT * FROM tags'
    tags = SqlRunner.run(sql)
    tags.map { |tag| Tag.new(tag) }
  end

  def self.find(id)
    sql = 'SELECT * FROM tags WHERE id = $1'
    values = [id]
    tag = SqlRunner.run(sql, values)[0]
    Tag.new(tag)
  end

  # UPDATE
  def update
    sql = 'UPDATE tags SET type = $1 WHERE id = $2'
    values = [@type, @id]
    SqlRunner.run(sql, values)
  end

  # DELETE
  def delete
    sql = 'DELETE FROM tags WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = 'DELETE FROM tags'
    SqlRunner.run(sql)
  end

end
