class Car
  attr_reader :make,
              :model,
              :color,
              :year,
              :age

  def initialize(hash)
    @description = [] << hash[:description]
    @description = @description.first.split(' ')
    @make = @description[1]
    @model = @description[2]
    @color = @description[0]
    @year = hash[:year]
    @age = 2021 - hash[:year].to_i
  end

end
