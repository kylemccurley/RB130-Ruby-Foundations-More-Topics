=begin
  Clock::at
  Clock::to_s

Clock::at:
=========+
  Input: Hours, Minutes
  Output:

  Clarifying Questions:
    > Is Clock::at a constructor?
    > What kind of variable should the Clock::at method initialize?
      - Instance Variables or Class Variables?
       - Instance Variable, because I may be working with multiple objects of Clock at the same time
    > Is the to_s called in the Minitest test suite an instance method?

  Rules/Reqirements:
    > Set clock to indicated hours.
    > Set instance variable to indicated minutes.

  Data Structure:
    > Instance Variable for Minute and Hour Inputs
    > Integer: Minute and Hour

  Algorithm:
    Given 1x or 2x integers: Hour, Minute
      > SET instance variable @hour = Hour
      > SET instance variable @minute = Minute
      > Return a reference to the class (Allow for proper method chaining with Clock::to_s)

Clock::to_s
==========+
  | SET string to format a max_size of 2 with leading 0s.
    | "Hours:Minutes"
      | Implicit Return of String

Clock::+
  Given an integer: minutes
    | ADD minutes % 60 to @@minutes
    | ADD hours / 60 to @@hours

Clock::-
  Given an integer: minutes
    | SUBTRACT minutes / 60 from @@hours
    | SUBTRACT minutes % 60 from @@minutes
    | IF minutes < 0: (a negative number) # Update the Time for hours
    |   SUBTRACT 1 from @@hours
    |   SET @@minutes to a positive number
=end

class Clock
  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  # Method to hard-code time.
  def self.at(hours, minutes = 0)
    Clock.new(hours, minutes)
  end

  # Method to increment time by given minutes.
  def +(minutes)
    @hours += minutes / 60
    @minutes += minutes % 60
    self # Return a reference to the Clock class to allow for method chaining
  end

  def -(minutes)
    @hours -= minutes / 60
    @minutes -= minutes % 60

    # If minutes goes below 0, decrement the clock's hour
    # by 1, then change the minutes to the 30-minutes prior. to the hour
    # Ex:
    # 9:00 - 30 minutes = 8:30
    if @minutes < 0
      @hours -= 1
      @minutes = -(@minutes)
    end
    self # Return a reference to the Clock class to allow for method chaining.
  end

  # Display clock-time as a string.
  def to_s
    '%02d:%02d' % [(@hours % 24), @minutes]
  end

  def ==(other_clock)
    self.to_s.eql?(other_clock.to_s)
  end
end
