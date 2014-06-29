class Person
	attr_accessor :name, :caffeine_level
	def initialize(name, caffeine_level=5)
		@name = name
		@caffeine_level = caffeine_level
	end

	def run
		@caffeine_level -=1
		puts "After running, your current caffeine_level is at #{@caffeine_level}."
	end

	def scream
		puts "ARRRRRGH!"
	end

	def drink_coffee(cups)
		@caffeine_level += 1
		puts "You increased your caffeine_level by #{cups}. Caffeine level is at #{@caffeine_level}."
	end
end

class PowerRanger
end

class EvilNinja
end

ted = Person.new("Ted")
ted.drink_coffee(1)