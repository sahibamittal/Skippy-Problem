require_relative 'kangaroo.rb'
require_relative 'grid.rb'
require_relative 'die.rb'
require_relative 'point.rb'

# main file to instantiate and execute each class so that Skippy can get home

kangaroo1 = Kangaroo.new("Skippy")

# instantiating Die with initial number of throws as 0
dice = Die.new

# take input value of dimensions of Grid from user and instantiate Grid class
puts "Enter dimension of the Grid (>=1): "

# throwing an error if user inputs the value of dimension smaller than 1
dimension = gets.to_i
if dimension < 1
  raise ArgumentError, "Dimension cannot be < 1", caller
end

# setting up the Grid inside which Skippy can hop
grid = Grid.new(dimension-1, dimension-1)

# initiating the simulation using Markov's Chain concept
# NOTE : probability is equal for all faces of Die so we'll use random function to simplify it
dice.start_simulate(dimension-1)

# output of whole journey of Skippy
puts "\nFinished in #{grid.total_hops} hops!\n"
puts "\nDie statistics : \n"
puts "Total throws : #{dice.totalThrows}\n"
puts "#{dice.percentOfThrows}"
