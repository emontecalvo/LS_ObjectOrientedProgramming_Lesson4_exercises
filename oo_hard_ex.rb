# Hard

#  - - - - - - - - - - - - -- - - Question 1

# Alyssa has been assigned a task of modifying a class that was 
# initially created to keep track of secret information. 
# The new requirement calls for adding logging, when 
# clients of the class attempt to access the secret data. 
# Here is the class in its current form:

# class SecretFile
#   attr_reader :data

#   def initialize(secret_data)
#     @data = secret_data
#   end
# end

# # She needs to modify it so that any access to data must result 
# # in a log entry being generated. That is, any call to the class
# #  which will result in data being returned must first call a logging 
# #  class. The logging class has been supplied to Alyssa and looks like 
# #   the following

# class SecurityLogger
#   def create_log_entry
#     # ... implementation omitted ...
#   end
# end
# Hint: Assume that you can modify the initialize method in 
# SecretFile to have an instance of SecurityLogger be passed in as 
# an additional argument. It may be helpful to review the lecture
#  on collaborator objects for this exercise.

# my answer:

class SecretFile
  attr_reader :data, :security_logger

  def initialize(secret_data)
    @data = secret_data
    @security_logger = SecurityLogger.new
  end
end

class SecurityLogger
  def create_log_entry
    puts "something"
    # ... implementation omitted ...
  end
end

one = SecretFile.new("thirty")
 => #<SecretFile:0x007fa1bb82d778 @data="thirty", @security_logger=#<SecurityLogger:0x007fa1bb82d750>> 
one.security_logger.create_log_entry
something
 => nil 

 # launch school answer:
 class SecretFile
  def initialize(secret_data, logger)
    @data = secret_data
    @logger = logger
  end

  def data
    @logger.create_log_entry
    @data
  end
end
# - - - - - - - - - -  - Question 2

# Ben and Alyssa are working on a vehicle management system. 
# So far, they have created classes called Auto and Motorcycle 
# to represent automobiles and motorcycles. After having noticed 
# common information and calculations they were performing for 
# each type of vehicle, they decided to break out the commonality
#  into a separate class called WheeledVehicle. 
# This is what their code looks like so far:

# class WheeledVehicle
#   attr_accessor :speed, :heading

#   def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
#     @tires = tire_array
#     @fuel_efficiency = km_traveled_per_liter
#     @fuel_capacity = liters_of_fuel_capacity
#   end

#   def tire_pressure(tire_index)
#     @tires[tire_index]
#   end

#   def inflate_tire(tire_index, pressure)
#     @tires[tire_index] = pressure
#   end

#   def range
#     @fuel_capacity * @fuel_efficiency
#   end
# end

# class Auto < WheeledVehicle
#   def initialize
#     # 4 tires are various tire pressures
#     super([30,30,32,32], 50, 25.0)
#   end
# end

# class Motorcycle < WheeledVehicle
#   def initialize
#     # 2 tires are various tire pressures along with
#     super([20,20], 80, 8.0)
#   end
# end

# # Now Alan has asked them to incorporate a new type of vehicle 
# # into their system - a Catamaran defined as follows:

# class Catamaran
#   attr_accessor :propeller_count, :hull_count, :speed, :heading, :range

#   def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
#     # ... code omitted ...
#   end
# end

# # This new class does not fit well with the object hierarchy defined 
# # so far. Catamarans don't have tires. But we still want common code 
# # to track fuel efficiency and range. Modify the class definitions 
# # and move code into a Module, as necessary, to share code among 
# # the Catamaran and the wheeled vehicles.

# answer:
module OmniVehicle
  attr_accessor :fuel_efficiency, :fuel_capacity
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  attr_accessor :speed, :heading
  include OmniVehicle

  def initialize(tire_array)
    @tires = tire_array
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  include OmniVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  include OmniVehicle
  def initialize
    # 2 tires are various tire pressures along with
    super([20,20], 80, 8.0)
  end
end

class Catamaran
  attr_accessor :propeller_count, :hull_count, :speed, :heading, :range
  include OmniVehicle

  def initialize(num_propellers, num_hulls)
    # ... code omitted ...
  end
end

# - - - - - - - - - - - - - - - - - Question 3

# Building on the prior vehicles question, we now must also track a basic motorboat.
#  A motorboat has a single propeller and hull, but otherwise behaves similar to a catamaran. 
#  Therefore, creators of Motorboat instances don't need to specify number of hulls or propellers.
#  How would you modify the vehicles code to incorporate a new Motorboat class?

# code to modify:
module Moveable
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Moveable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class FloatyThing

  attr_accessor :propeller_count, :hull_count
  include Moveable

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end


end

class Catamaran < FloatyThing
  include Moveable

  # attr_accessor :propeller_count, :hull_count

   def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    # ... other code to track catamaran-specific data omitted ...
  end
end
# answer:

class Motorboat < FloatyThing
  include Moveable

  def initialize((km_traveled_per_liter, liters_of_fuel_capacity))
    # specific Motorboat code
  end
end


# - - - - - - - - - - - - - -- - Question 4
# The designers of the vehicle management system now want to make an adjustment for
#  how the range of vehicles is calculated.
#  For the seaborne vehicles, due to prevailing ocean currents, they want to add an 
#  additional 10km of range even if the vehicle is out of fuel.

# Alter the code related to vehicles so that the range for autos and motorcycles is 
# still calculated as before, but for catamarans and motorboats, the range method will 
# return an additional 10km.

# answer:


module Moveable
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Moveable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class FloatyThing

  attr_accessor :propeller_count, :hull_count
  include Moveable
### answer, override range def:
  def range
    @fuel_capacity * @fuel_efficiency + 10
  end

  # launch school answer:
  def range
    range_by_using_fuel = super
    return range_by_using_fuel + 10
  end

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end
end

class Catamaran < FloatyThing
  include Moveable

  # attr_accessor :propeller_count, :hull_count

   def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    # ... other code to track catamaran-specific data omitted ...
  end
end
# answer:

class Motorboat < FloatyThing
  include Moveable

  def initialize((km_traveled_per_liter, liters_of_fuel_capacity))
    # specific Motorboat code
  end
end




