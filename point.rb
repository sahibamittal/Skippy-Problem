require_relative 'die.rb'
require_relative 'Grid'

# A (probably mutable) point in the grid, defined by and x- and y-coordinate.

class Point
  attr_accessor :x, :y

  def initialize(dx, dy)
    @@x = dx
    @@y = dy
  end

  Transitions = %w(N E W S)

  # method to move Skippy from one point to another within boundaries
  # after each move, it will call a check on Grid if Skippy hit the boundary or not
  # if Skippy hits boundary and cannot hop, it will move back to previous position
  def move(temp, n)

      nextState = Transitions[temp]
      #puts "next state : #{nextState}"
      tempX = @@x
      tempY = @@y
      case nextState
      when 'N' then @@y += 1
      when 'E' then @@x += 1
      when 'W' then @@x -= 1
      when 'S' then @@y -= 1
      end
      hopped = Grid.checkBorder(@@x,@@y,n)
      # Skippy hits boundary and cannot hop this move, so it will restore its previous position
      if hopped == 0
        @@x = tempX
        @@y = tempY
      end
  end

  # getters
  def getX
    @@x
  end

  def getY
    @@y
  end

end

