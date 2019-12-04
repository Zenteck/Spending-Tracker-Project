require_relative('../db/sql_runner')
require_relative('./transaction.rb')

class Budget

  attr_reader :id
  attr_accessor :budget

  def initialize(info)
    @id = info['id'].to_i() if info['id']
    @budget = info['budget'].to_f()
  end

  def save()
    sql = "INSERT INTO budgets
    (budget) VALUES ($1)
    RETURNING id"
    values = [@budget]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.get_id
    sql = 'SELECT * FROM budgets'
    budget_hash = SqlRunner.run(sql)
    budget_hash.map{ |budget| Budget.new(budget) }
    return budget_hash[0]['id']
  end

  def self.find()
    sql = 'SELECT * FROM budgets'
    budget = SqlRunner.run(sql)[0]
    return Budget.new(budget)
  end

  def self.delete_all()
    sql = 'DELETE FROM budgets'
    SqlRunner.run(sql)
  end

  def self.update(new_budget)
    sql = 'UPDATE budgets SET budget = $1'
    values = [new_budget.budget]
    SqlRunner.run(sql, values)
  end

  def self.budget()
    sql = 'SELECT * FROM budgets'
    budget = SqlRunner.run(sql)
    budget.map { |budget| Budget.new(budget) }
    return budget[0]['budget']
  end

  def self.check_spending()
    budget = self.budget.to_f
    spend = Transaction.total_spend
    return spend / (budget / 100)
  end

end
