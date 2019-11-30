require_relative('../db/sql_runner')

class Budget

  attr_reader id
  attr_accessor :budget

  def initialize(info)
    @id = info['id'].to_i() if info['id']
    @budget = info['budget']
  end



end
