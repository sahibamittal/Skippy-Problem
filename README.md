***Skippy Problem using Ruby***

This program uses the Markov Chain algorithm to find the next state based on the previous state. However, since probability of next states provided previous state is equal in each case, I've not used probability vector but the simple random function to calculate next random state (direction here).

**main.rb :** main will instantiate Kangaroo, Grid based on dimension provided by user (error thrown if invalid dimension is provided). It will trigger the start of die simulation (journey of Skippy) and will print the output accordingly.

**die.rb :** Dice with 4 sides namely, North, East, West, South are initialized with a hash function maintaining the number of throws resulting in each side. It has methods to throw dice to calculate the next random move, total number of throws required by Skippy and percent of throws resulting it to move in each direction.
Upon starting simulation, it will also initialize position of Skippy as (0,0) and calls method 'move' of class Point to hop to next point accordingly.

**point.rb :** initialize initial position of Skippy, moves it from one point to another within boundaries. How? After each move, it will call a check on Grid if Skippy hits the boundary or not. If it hits boundary of Grid, it cannot hop and it will move back to its previous position.

**grid.rb :** defines the boundaries of Grid based on the input dimension. It has a check function to see if Skippy can hop or not to the next point calculated by Dice based on which it will print the appropriate action performed - hopped or hit? If it hits border and cannot hop, it will tell class Point to move back and a new random valid direction will be simulated.

**Design :** Grid, Point and Die classes have use-a relationships with one another. Program encapsulates all logical processing in classes and run commands using main file only. Refer the image attached to view the flow chart of activities and decisions involved. Classes are implemented such that they are independent and re-usable. Moreover, variable of all classes are private and cannot be accessed/mutated directly but using specific custom methods only (if any).
