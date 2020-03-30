=begin
Typically meetups happen on the same day of the week.

Examples are

the first Monday
the third Tuesday
the Wednesteenth
the last Thursday

Note that "Monteenth", "Tuesteenth", etc are all made up words.

There was a meetup whose members realised that there are exactly 7 days that
end in '-teenth'. Therefore, one is guaranteed that each day of the week
(Monday, Tuesday, ...) will have exactly one date that is
named with '-teenth' in every month.

Rules/Requirements:
  > Each day of the week will have exactly one date that is named '-teenth'
  in every month.
  > :first, :second, :third, etc are all 7-day ranges

Constructor:
  Input: Month, Year
  Output:

day() method:
  Objective/Mental Model:
    Return the date for the weekday within a given schedule.

  Input: Weekday, Schedule of Weekday
  Output: Date-object of the weekday within the designated schedule.

  Data Structure:
    > Weekday, Schedule: :Symbol
    > Starting Day for Schedule: Hash
    > Method Return Value: Date

  Algorithm: Given a weekday and a schedule for weekday within the month: |weekday, schedule|
    > SET the starting day to the value of starting_day ranges at key of schedule
    > SET range to Date at starting day upto Date at starting day + 6
    > DETECT the element within range that is of the given weekday.
      > IMPLICIT RETURN
=end

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
    @starting_day = {
      first: 1,
      second: 8,
      third: 15,
      fourth: 22,
      last: -7, # Will need to do a specific logic branch handler for :last
      teenth: 13
    }
  end

  def day(weekday, schedule)
    starting_day = @starting_day[schedule]
    range = Date.new(@year, @month, starting_day)..Date.new(@year, @month, starting_day + 6)
    range.detect { |date| date.public_send(weekday.to_s + '?') }
  end
end
