class Triangle
  def initialize(rows); end
  def rows; end
end
=begin
  Rows:
    Input: Number of rows from constructor
    Output: Nested Array of Rows

    Rules/Requirements:
      - Each Number Computed By ADDING the numbers directly above the number.

    Data Structure:
      Nested Array: Rows
      Integers: Elements Within The Triangle
      Array/Sub-Array: Pascal's Triangle Row

    Mental Model:
      Write a program that take the number of rows for Pascal's triangle
      and returns a nested Array containing each individul row
      of the triangle.

    Algorithm:
      Given an integer: number_of_rows
        SET an empty array: outcome = []
        IF number_of_rows <= 2
          LOOP do |num|
            APPEND ([1] * num) to outcome
          END
        ELSE
          SET outcome = [[1], [1, 1]]
          REPEAT (number_of_rows - 2)#times:
            APPEND ([1] + outcome.last.each_cons(2).map { |nums| nums.inject(:+) } + [1]).flatten
            to outcome
          END
        END

        RETURN outcome
=end

=begin
    1
   1 1
  1 2 1
 1 3 3 1
1 4 6 4 1
=end

class Triangle
  def initialize(rows)
    @number_of_rows = rows
  end

  def rows
    outcome = []

    if @number_of_rows <= 2
      1.upto(@number_of_rows) { |num| outcome << ([1] * num) }
    else
      outcome = [[1], [1, 1]]
      (@number_of_rows - 2).times do |_|
        outcome << ([1] + outcome.last.each_cons(2).map { |nums| nums.inject(:+) } + [1]).flatten
      end
    end

    outcome
  end
end
