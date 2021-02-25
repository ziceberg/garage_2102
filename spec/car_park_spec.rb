require 'rspec'
require 'pry'
require 'simplecov'
SimpleCov.start
require './lib/car'
require './lib/owner'
require './lib/garage'

RSpec.configure do |config|
  config.default_formatter = 'doc'
end

RSpec.describe 'car park spec' do
  before :each do
    @regina = Owner.new('Regina George', 'Heiress')
    @glen = Owner.new('Glen Coco', 'Unknown')
    @garage = Garage.new('Totally Safe Parking')
    @mustang = Car.new({description: 'Green Ford Mustang', year: '1967'})
  end

  describe 'Iteration 1' do
    it '1. Car #new' do
      expect(Car).to respond_to(:new).with(1).argument
      expect(@mustang).to be_an_instance_of(Car)
    end

    it '2. Car Attributes' do
      expect(@mustang.make).to eq("Ford")
      expect(@mustang.model).to eq("Mustang")
      expect(@mustang.color).to eq("Green")
      expect(@mustang.year).to eq("1967")
    end

    it '3. Car #age - change this in 2022' do
      expect(@mustang.age).to eq(54)
    end
  end 

  describe 'Iteration 2' do
    it '4. Owner #new' do
      expect(Owner).to respond_to(:new).with(2).argument
      expect(@regina).to be_an_instance_of(Owner)
    end

    it '5. Owner Attributes' do
      expect(@regina.name).to eq("Regina George")
      expect(@regina.occupation).to eq("Heiress")
      expect(@regina.cars).to eq([])
    end

    it '6. Owner #buy' do
      @regina.buy('1967 Green Ford Mustang')
      expect(@regina.cars.first).to be_an_instance_of(Car)
      expect(@regina.cars.count).to eq(1)
      @regina.buy('2001 Silver BMW 3-Series')
      expect(@regina.cars.last).to be_an_instance_of(Car)
      expect(@regina.cars.count).to eq(2)
    end

    it '7. Owner #vintage_cars' do
      @regina.buy('1967 Green Ford Mustang')
      @regina.buy('2001 Silver BMW 3-Series')
      @regina.buy('1963 Red Chevrolet Corvette')
      expect(@regina.vintage_cars.first.year).to eq("1967")
      expect(@regina.vintage_cars.last.year).to eq("1963")
      expect(@regina.vintage_cars.count).to eq(2)
    end
  end

  describe 'Iteration 3' do
    it '8. Garage #new' do
      expect(Garage).to respond_to(:new).with(1).argument
    end

    it '9. Garage Attributes' do
      expect(@garage.name).to eq("Totally Safe Parking")
      expect(@garage.customers).to eq([])
    end

    it '10. Garage #add_customer' do
      @garage.add_customer(@regina)
      @garage.add_customer(@glen)

      expect(@garage.customers.first).to eq(@regina)
      expect(@garage.customers.last).to eq(@glen)
    end

    it '11. Garage #all_cars' do
      @regina.buy('1967 Green Ford Mustang')
      @regina.buy('2001 Silver BMW 3-Series')
      @glen.buy('1963 Red Chevrolet Corvette')
      @garage.add_customer(@regina)
      @garage.add_customer(@glen)

      expect(@garage.all_cars[0].year).to eq("1967")
      expect(@garage.all_cars[1].year).to eq("2001")
      expect(@garage.all_cars[2].year).to eq("1963")
    end

    it '12. Garage #cars_by_make' do
      @regina.buy('1967 Green Ford Mustang')
      @regina.buy('2001 Blue Ford Escape')
      @glen.buy('1963 Red Chevrolet Corvette')
      @glen.buy('2020 Silver Volvo XC90')
      @garage.add_customer(@regina)
      @garage.add_customer(@glen)

      actual = @garage.cars_by_make

      expect(actual["Ford"].first.year).to eq("1967")
      expect(actual["Ford"].last.year).to eq("2001")
      expect(actual["Ford"].count).to eq(2)

      expect(actual["Chevrolet"].first.year).to eq("1963")
      expect(actual["Chevrolet"].count).to eq(1)

      expect(actual["Volvo"].first.year).to eq("2020")
      expect(actual["Volvo"].count).to eq(1)
    end

    it '13. Garage #oldest_cars' do
      @regina.buy('1967 Green Ford Mustang')
      @regina.buy('2001 Blue Ford Escape')
      @glen.buy('1963 Red Chevrolet Corvette')
      @glen.buy('2020 Silver Volvo XC90')
      @garage.add_customer(@regina)
      @garage.add_customer(@glen)

      actual = @garage.oldest_cars
      years = actual.map {|car| car.year}
      expect(years).to include("1967","2001","1963")
      expect(years).not_to include("2020")
    end
  end

  describe 'Iteration 4' do
    it '14. Garage #owner_of_oldest_car' do
      @regina.buy('1967 Green Ford Mustang')
      @regina.buy('2001 Blue Ford Escape')
      @glen.buy('1963 Red Chevrolet Corvette')
      @glen.buy('2020 Silver Volvo XC90')
      @garage.add_customer(@regina)
      @garage.add_customer(@glen) 

      expect(@garage.owner_of_oldest_car).to eq("Glen Coco")
    end

    it '15. Garage #cars_in_range' do
      @regina.buy('1967 Green Ford Mustang')
      @regina.buy('2001 Blue Ford Escape')
      @glen.buy('1963 Red Chevrolet Corvette')
      @glen.buy('2020 Silver Volvo XC90')
      @garage.add_customer(@regina)
      @garage.add_customer(@glen) 
      
      actual = @garage.cars_in_range(1967..2020)
      years = actual.map {|cars| car.year}
      
      expect(years.count).to eq(3)
      expect(years).to include("1967","2001","1963")
      expect(years).not_to include("2020")
    end
  end
end
