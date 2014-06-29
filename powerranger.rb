class Person
	attr_accessor :name, :caffeine_level
	def initialize(name, caffeine_level=10)
		@name = name
		@caffeine_level = caffeine_level
	end

	def run
		if @caffeine_level > 5
			@caffeine_level -=5
			puts "#{name} has run away to safety. After running, #{name}'s current caffeine level is at #{@caffeine_level}."
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
		puts "#{name} increased their caffeine_level by #{cups}. Caffeine level is at #{caffeine_level}."
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
			person.caffeine_level -=5
			@caffeine_level -=2
		else
			puts "#{person.name} caught a glancing blow."
			person.caffeine_level -=2
			@caffeine_level -=1
		end
		person.run
		puts "The #{name}'s current caffeine level is now #{@caffeine_level}."
	end

	def use_megazord(person)
		@strength = 5000
		if @strength > 4999
			person.caffeine_level =0
			puts "#{person.name} was thrown through a building, caught in midair on the otherside, thrown even higher into the air, caught just before entering space, and punched down to the ground with such force that created a 6 mile wide crater! The #{person.name} has been defeated."
			@caffeine_level -=50
		end
		person.scream
		puts "The #{name}'s current caffeine level is now #{@caffeine_level}.  #{person.name} has been defeated."
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
			puts "#{person.name} was punched very hard by #{name}."
			person.caffeine_level -=5
			@caffeine_level -=2
		else
			puts "#{person.name} caught a glancing blow from #{name}."
			person.caffeine_level -=2
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

def fight_scene
	ted = Person.new("Ted", 50)
	rick = Person.new("Rick", 50)
	puts "----------------------------"
	red_ranger = PowerRanger.new("Red Ranger", "red", 100, 100)
	blue_ranger = PowerRanger.new("Blue Ranger", "blue", 100, 100)
	puts "----------------------------"
	gray_ninja = EvilNinja.new("Gray Assassin", 100, 100, 100)
	green_ninja = EvilNinja.new("Green Assassin", 100, 100, 100)
	puts "----------------------------"
	gray_ninja.punch(rick)
	red_ranger.punch(gray_ninja)
	blue_ranger.punch(green_ninja)
	green_ninja.punch(ted)
	ted.run
	ted.drink_coffee(10)
	gray_ninja.cause_mayhem(rick)
	red_ranger.use_megazord(gray_ninja)
	green_ninja.run
	red_ranger.drink_coffee(20)
	blue_ranger.drink_coffee(5)
end

fight_scene
