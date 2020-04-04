=begin
Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name.
The first time you boot them up, a random name is generated, 
such as RX837 or BC811.

Every once in a while we need to reset a robot to its factory settings, 
which means that their name gets wiped. 
The next time you ask, it will respond with a new random name.

The names must be random: they should not follow a predictable sequence.
Random names means a risk of collisions. 
Your solution should not allow the use of the same name twice when avoidable.

Constructor Method:
  - 2x Capital Alphabetical Letters
  - 3x Digits
=end

class Robot
  @all_names = []
  
  def name
    @name ||= generate_name
  end
  
  def reset
    @name = nil
  end
  
  def self.all_names
    @all_names
  end
  
  private
  
  def generate_name
    name = letters + numbers

    if Robot.all_names.include?(name)
      name = generate_name
    else
      Robot.all_names << name
    end

    name
  end
  
  def letters
    random_char + random_char
  end
  
  def numbers
    "%03d" % (0..999).to_a.sample
  end
  
  def random_char
    ('A'..'Z').to_a.sample
  end
end
