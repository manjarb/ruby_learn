# This is how you define your own custom exception classes
class NoOrangesError < StandardError
end

class OrangeTree

  attr_accessor :age, :height,:oranges_for_pick,:orange_diameter

  def initialize()
    @age = 0
    @height = 0
    @is_die = false
    @Orange = Orange.new(0)
    @orange_diameter = @Orange.diameter
    @oranges_for_pick = 0
  end

  # Ages the tree one year
  def age!
    @age += 1
    @height += 10
    @orange_diameter+= 2
    @oranges_for_pick += 2
  end

  # Returns +true+ if there are any oranges on the tree, +false+ otherwise
  def any_oranges?
    if @oranges_for_pick <= 0
      @is_die = true
      return false
    else 
      return true
    end
  end

  # Returns an Orange if there are any
  # Raises a NoOrangesError otherwise
  def pick_an_orange!

    raise NoOrangesError, "This tree has no oranges" unless self.any_oranges?

    if @oranges_for_pick <= 0
      # puts "dead"
    else
      #puts "not dead"
      @oranges_for_pick -=1
      return 1
    end
    # orange-picking logic goes here
  end

  def dead?
    if @is_die == true

      return true
    else

      return false
    end
  end
end

class Orange
  attr_accessor :diameter
  # Initializes a new Orange with diameter +diameter+
  def initialize(diameter)
    @diameter = diameter
  end
end

tree = OrangeTree.new 

tree.age! until tree.age == 30

puts "There is #{tree.age} years old and #{tree.height} feet tall"

#until tree.dead? == true
  basket = []

  while tree.any_oranges?
    basket << tree.pick_an_orange!
  end

  avg_diameter = tree.orange_diameter / tree.age# It&#39;s up to you to calculate the average diameter for this harvest.
  puts "Year #{tree.age} Report"
  puts "Tree height: #{tree.height} feet" 
  puts "Harvest: #{basket.size} oranges with an average diameter of #{avg_diameter} inches" 
  puts "" # Age the tree another year tree.age! end puts "Alas, the tree, she is dead!"

  #Age the tree another year
  tree.age!

#end

puts "Alas, the tree, she is dead!"
