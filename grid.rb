# The grid that Skippy is hopping about on, can be of any dimension.

class Grid

  attr_accessor :x, :y, :hops

  def initialize(xBorder, yBorder)
    @x = xBorder
    @y = yBorder
    @@hops = 0
  end

  # method to check if Skippy can hop or not to the next point
  # based on this, method will print the appropriate action performed
  # And, if Skippy hits boundary and cannot hop,
  # it will tell the 'move' method in class Point to move back to previous position
  def self.checkBorder(dx,dy,n)
    hop = 0
    output = ""
    if dx < 0 || dy < 0 || dx > n || dy > n
      output = "Oops, hit the boundary : #{dx},#{dy}\n"
      hop = 0
    else
      output = "Hopped to : #{dx},#{dy}\n"
      @@hops += 1
      hop = 1
    end
    puts output
    return hop
  end

  # calculates the total number of valid hops performed by Skippy to reach home
  def total_hops
    return @@hops
  end

end