# A 4-sided die, with each side representing a direction, North, South, East or West.
# Also stores a hash table to keep track of the number of throws in each direction so far.

class Die

  attr_accessor :north,:south,:east,:west,:sum,:numberOfThrows,:current_throw

  def initialize

    # hash to store the key-value pairs for dice-side and number of throws in that direction
    @numberOfThrows = {'north'=> 0, 'south'=> 0, 'east'=> 0, 'west'=> 0}
    @sum = 0
  end

  # calling random method each time dice is thrown
  # using hash function to map key-value pairs for each side of dice - North, West, East, South
  # hash values will maintain the number of times for each direction Skippy moves in

  def throw_dice
    @current_throw = rand(4)  #equal probability
    if @current_throw == 0 then @numberOfThrows['north'] += 1
    elsif @current_throw == 1 then @numberOfThrows['east'] += 1
    elsif @current_throw == 2 then @numberOfThrows['west'] += 1
    else
      @numberOfThrows['south'] += 1
    end
    @current_throw
  end

  # calculating total number of throws took by Skippy to reach home
  def totalThrows
    @sum = @numberOfThrows['north']+@numberOfThrows['south']+@numberOfThrows['east']+@numberOfThrows['west']
    @sum
  end

  # calculating the percent of each direction Skippy tried to hop
  # Also, rounding up the float value to two decimal places
  def percentOfThrows

    north = ((@numberOfThrows['north'].to_f/@sum)*100).round(2)
    south = ((@numberOfThrows['south'].to_f/@sum)*100).round(2)
    east = ((@numberOfThrows['east'].to_f/@sum)*100).round(2)
    west = ((@numberOfThrows['west'].to_f/@sum)*100).round(2)
    output = "North: #{north}%  South: #{south}%  East: #{east}%  West: #{west}%"
    return output
  end

  # method to start simulation with n = grid maximum size
  def start_simulate(n)
    # initial position of Skippy
    position = Point.new(0,0)
    dx = position.getX
    dy = position.getY
    until (dx == n && dy == n) do
      step = throw_dice
      position.move(step, n)
      dx = position.getX
      dy = position.getY
    end
  end


end