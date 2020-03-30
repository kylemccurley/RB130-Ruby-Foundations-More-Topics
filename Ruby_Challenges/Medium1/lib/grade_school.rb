=begin
Write a small archiving program that stores students' names along with the grade that they are in.

-- add(name, grade) Method
Add a student's name to the roster for a grade
"Add Jim to grade 2."
"OK."


-- grade(grade_num)
Get a list of all students enrolled in a grade
"Which students are in grade 2?"
"We've only got Jim just now."


-- to_h() method
Get a sorted list of all students in all grades. Grades should sort as 1, 2, 3, etc.,
and students within a grade should be sorted alphabetically by name.
{1=>["Anna", "Barb", "Charlie"], 2=>["Alex", "Peter"], ...}


The exact output format doesn't matter: what's important is that it
shows all of the students and grades in the proper order.

Note that all our students only have one name. (It's a small town, what do you want?)

add method:
  Input: name, grade
  Output: N/A

  Data Structure:
    > Name: String
    > Grade: Integer
    > Names: Array

  Algorithm: Given a name and a grade: |name, grade|
    IF key for grade has not been set @students[grade].nil?
      SET @students[grade] = name
    ELSE
      APPEND name TO @students[grade]
    END

grade method:
  Input: grade_number
  Output: Array of Student Names for the Given Grade

  Data Structure:
    - List of Students: Array
    - Grade: Integer

  Mental Model:
      Write a method, grade, that takes an integer for the grade number, and returns
    the list of student names for that grade. The list is an array from the
    students hash.

  Algorithm: Given an integer: grade_number
    > Reference the value within @students at the grade_number.

to_h() method
  Input: None
  Output: Hash of Grades and Student Names

  Algorithm:
    > SET a local variable: outcome
      > Set to an empty hash: {}
    > SORT through each key of @students least to greatest (Hash#keys#sort): |grade|
      > SET outcome[grade] = SORTED @students[grade]
    > RETURN outcome
=end

class School
  def initialize
    @students = {}
  end

  def add(name, grade)
    if @students[grade].nil?
      @students[grade] = [name]
    else
      @students[grade] << name
    end
  end

  def grade(num)
    return [] if @students[num].nil?

    @students[num]
  end

  def to_h
    outcome = {}
    @students.keys.sort.each do |grade|
      outcome[grade] = @students[grade].sort
    end
    outcome
  end
end
