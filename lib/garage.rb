class Garage
  attr_reader :name,
              :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def all_cars
    all_cars_arr = []
    @customers.each do |customer|
      customer.cars.each do |car|
        all_cars_arr << car
      end
    end
    all_cars_arr
  end

  def cars_by_make
    cars_by_make_hash = {}
    all_cars.each do |car|
      cars_by_make_hash[car.make] = [] if cars_by_make_hash[car.make].nil?
        cars_by_make_hash[car.make] << car
    end
    cars_by_make_hash
  end

  def oldest_cars
    all_cars.find_all do |car|
      car.year.to_i < 2020 # re-work
    end
  end

  # def owner_of_oldest_car
  #   @customers.each do |customer|
  #     customer.cars.select do |car|
  #       customer.name if car.year.to_i > car.year.to_i
  #     end
  #   end
  # end
end
