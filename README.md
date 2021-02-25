# Car Park

## Instructions

* Fork this Repository
* Clone your forked repo to your computer.
* Complete the activity below.
* Push your solution to your forked repo
* Submit a pull request from your repository to this repository
* Put your name in your PR!

### Iteration 1

Use TDD to create a `Car` class that respond to the following interaction pattern.
You may presume that the description will only ever be exactly three words in length 
in this order.

```ruby
pry(main)> require './lib/car'
# => true

car_1 = Car.new({description: 'Green Ford Mustang', year: '1967'})
# => #<Car:0x00007fcb13bd22d0...>

car_1.make
# => "Ford"

car_1.model 
# => "Mustang"

car_1.color
# => "Green"

car_1.year
# => "1967"

car_1.age
# => 54
```

### Iteration 2

Use TDD to create an `Owner` class that responds to the following interaction pattern.
The `buy` method must take a single string as an argument and it has to return an instance of `Car`.
A car is vintage if it is 25 years or older.

```ruby
pry(main)> require './lib/car'
# => true

pry(main)> require './lib/owner'
# => true

pry(main)> owner_1 = Owner.new('Regina George', 'Heiress')
# => #<Owner:0x00007fb898081850...>

pry(main)> owner_1.name
# => "Regina George"

pry(main)> owner_1.occupation
# => "Heiress"

pry(main)> owner_1.cars
# => []

pry(main)> owner_1.buy('1967 Green Ford Mustang')
# => #<Car:0x00007fcb13bd22d0...>

pry(main)> owner_1.cars
# => [#<Car:0x00007fcb13bd22d0...>]
 
pry(main)> owner_1.buy('2001 Silver BMW 3-Series')
# => #<Car:0x00007fb898081850...>

pry(main)> owner_1.cars
# => [#<Car:0x00007fcb13bd22d0...>, #<Car:0x00007fb898081850...>] 

pry(main)> owner_1.buy('1963 Red Chevrolet Corvette')
# => #<Car:0x00007fb898081850...> 

pry(main)> owner_1.vintage_cars
# => [#<Car:0x00007fcb13bd22d0...>, #<Car:0x00007fb898081850...>]
```

### Iteration 3

Use TDD to create an `Garage` class that responds to the following interaction pattern.
`oldest_cars`, returns the three oldest cars.


```ruby
pry(main)> require './lib/car'
# => true

pry(main)> require './lib/owner'
# => true

pry(main)> require './lib/garage'
# => true

pry(main)> garage = Garage.new('Totally Safe Parking')
# => #<Garage:0x00007f8c019506c0...>

pry(main)> owner_1 = Owner.new('Regina George', 'Heiress')
# => #<Owner:0x00007fb898081850...>

pry(main)> owner_1.buy('1967 Green Ford Mustang')
# => #<Car:0x00007fcb13bd22d0...>

pry(main)> owner_1.buy('2001 Blue Ford Escape')
# => #<Car:0x00007fb898081850...>

pry(main)> owner_2 = Owner.new('Glen Coco', 'Unknown')
# => #<Owner:0x00007fceac8f0480...>

pry(main)> owner_2.buy('1963 Green Chevrolet Corvette')
# => #<Car:0x00007fb898081850...> 

pry(main)> owner_2.buy('2020 Silver Volvo XC90')
# => #<Car:0x00007fb5ef98b118...>


pry(main)> garage.name
# => "Totally Safe Garage"

pry(main)> garage.add_customer(owner_1)

pry(main)> garage.add_customer(owner_2)

pry(main)> garage.customers
# => [#<Owner:0x00007fb898081850...>, #<Owner:0x00007fceac8f0480...>]

pry(main)> garage.all_cars
# => [#<Car:0x00007fcb13bd22d0...>, #<Car:0x00007fb898081850...>, #<Car:0x00007fb898081850...>, #<Car:0x00007fb5ef98b118...>]

pry(main)> garage.cars_by_make
# => {
#   "Ford" => [#<Car:0x00007fcb13bd22d0...>, #<Car:0x00007fb898081850...>],
#   "Chevrolet" => [#<Car:0x00007fb898081850...>],
#   "Volvo" => [#<Car:0x00007fb5ef98b118...>]
#    }

pry(main)> garage.oldest_cars
# => [#<Car:0x00007fcb13bd22d0...>, #<Car:0x00007fb898081850...>, #<Car:0x00007fb898081850...>] 
```

### Iteration 4

Continue using TDD to add functionality to the `Garage` object
`cars_in_range` accepts a single Range object as an argument. This is inclusive.

```ruby
pry(main)> require './lib/car'
# => true

pry(main)> require './lib/owner'
# => true

pry(main)> require './lib/garage'
# => true

pry(main)> garage = Garage.new('Totally Safe Parking')
# => #<Garage:0x00007f8c019506c0...>

pry(main)> owner_1 = Owner.new('Regina George', 'Heiress')
# => #<Owner:0x00007fb898081850...>

pry(main)> owner_1.buy('1967 Green Ford Mustang')
# => #<Car:0x00007fcb13bd22d0...>

pry(main)> owner_1.buy('2001 Blue Ford Escape')
# => #<Car:0x00007fb898081850...>

pry(main)> owner_2 = Owner.new('Glen Coco', 'Unknown')
# => #<Owner:0x00007fceac8f0480...>

pry(main)> owner_2.buy('1963 Green Chevrolet Corvette')
# => #<Car:0x00007fb898081850...> 

pry(main)> owner_2.buy('2020 Silver Volvo XC90')
# => #<Car:0x00007fb5ef98b118...>

pry(main)> garage.add_customer(owner_1)

pry(main)> garage.add_customer(owner_2)

pry(main)> garage.owner_of_oldest_car
# => "Glen Coco"

pry(main)> garage.cars_in_range(1967..2020)
# => [#<Car:0x00007fcb13bd22d0...>, #<Car:0x00007fb898081850...>, #<Car:0x00007fb5ef98b118...>]
```