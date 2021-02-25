require 'pry'
require './lib/car'
class Owner
  attr_reader :name,
              :occupation,
              :cars

  def initialize(name, occupation)
    @name = name
    @occupation = occupation
    @cars = []
  end

  def buy(string)
    string_array = [] << string
    string_array = string_array.first.split(' ')
    year = string_array[0]
    color = string_array[1]
    make = string_array[2]
    model = string_array[3]
    string_array = [color, make, model].join(' ')
    description_string = string_array.to_s
    car = Car.new({description: description_string, year: year})
    @cars << car
  end

  def vintage_cars
    @cars.find_all do |car|
      car.age >= 25
    end
  end
end
