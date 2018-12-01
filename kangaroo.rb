#Skippy is an instance of this class.

class Kangaroo

  attr_accessor :name

  def initialize(dname)
    @name = dname
    puts "Kangaroo named #{@name} is about to start its journey from (0,0) : \n\n"
  end
end