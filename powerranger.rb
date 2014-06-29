class Person
	attr_accessor :name, :caffeine_level
	def initialize(name, caffeine_level=10)
		@name = name
		@caffeine_level = caffeine_level
	end

	def run
		if @caffeine_level > 5
			@caffeine_level -=5
			puts "#{name} has run away to safety. After running, #{name}'s current caffeine_level is at #{@caffeine_level}."
		else
			@caffeine_level < 1
			puts "#{name} has no energy left to retreat and has been defeated."
		end	
	end

	def scream
		puts "#{name} screams ARRRRRGH!"
	end

	def drink_coffee(cups)
		@caffeine_level += 1
		puts "You increased your caffeine_level by #{cups}. Caffeine level is at #{@caffeine_level}."
	end
end

class PowerRanger < Person

	attr_accessor :strength
	def initialize(name, color, strength=0, caffeine_level=0)
		super(name, caffeine_level)
		@strength = strength
		@color = color
	end

	def punch(person)
		if @strength > 5
			puts "#{person.name} was somersaulted into the air!"
			@caffeine_level -=5
		else
			puts "#{person.name} caught a glancing blow."
			@caffeine_level -=1
		end
		person.run
		puts "The #{name}'s current caffeine level is now #{@caffeine_level}."
	end

	def use_megazord(person)
		@strength = 5000
		if @strength > 4999
			puts "#{person.name} was thrown through a building, caught in midair on the otherside, thrown even higher into the air, caught just before entering space, and punched down to the ground with such force that created a 6 mile wide crater!"
			@caffeine_level -=50
		end
		person.scream
		puts "The #{name}'s current caffeine level is now #{@caffeine_level}."
	end
end

class EvilNinja < Person
	attr_accessor :name, :evilness, :strength, :caffeine_level
	def initialize(name, evilness=0, strength=0, caffeine_level=0)
		super(name, caffeine_level)
		@evilness = evilness
		@strength = strength
	end

	def punch(person)
		if @strength > 5
			puts "#{person.name} was punched very hard."
			@caffeine_level -=5
		else
			puts "#{person.name} caught a glancing blow."
			@caffeine_level -=1
		end
		person.run
		puts "The #{name}'s current caffeine level is now #{@caffeine_level}."
	end

	def cause_mayhem(person)
		person.caffeine_level = 0
		puts "#{person.name} was hit by mayhem, causing his energy to drop to #{person.caffeine_level}. #{person.name} has been defeated!"
		@caffeine_level -=75
		puts "#{name}'s caffeine level is at #{@caffeine_level} after causing mayhem."
	end
end

ted = Person.new("Ted")
rick = Person.new("Rick", 60)
puts "----------------------------"
red_ranger = PowerRanger.new("Red Ranger", "red", 100, 100)
red_ranger.punch(ted)
red_ranger.use_megazord(ted)
red_ranger.punch(ted)
puts "----------------------------"
gray_ninja = EvilNinja.new("Gray Assassin", 100, 100, 100)
gray_ninja.punch(rick)
gray_ninja.cause_mayhem(rick)