require 'colorize'

class BabyDragon
	attr_reader :fullness_level

	def initialize(name)
		@name = name
		@is_asleep = false
		# The dragon is not hungry when @fullness_level is 10
		# The dragon is starving when @fullness_level is 0
		@fullness_level = 10

		puts "#{@name} is born!"
		pretty_put(File.read('born.txt'))
	end

	def play
		puts "\n\n#{@name} chills out next to the fireplace and plays with some Legos."
		pretty_put(File.read('play.txt'))

		passage_of_time
	end

	def take_a_nap
		puts "\n\n#{@name} curls up and dozes off..."
		pretty_put(File.read('sleep.txt'))

		@is_asleep = true

		3.times do
			passage_of_time		
		end

		@is_asleep = false
	end

	def eat
		puts "\n\n#{@name} eats popcorn, cheez-its, seaweed, cheetos, burritos"
		pretty_put(File.read('eat.txt'))

		@fullness_level += 1
		
		passage_of_time
	end

	def passage_of_time
		if @fullness_level > 0
			@fullness_level -= 1
		else
			if @is_asleep
				@is_asleep = false
				puts "#{@name} woke up!"
			end
			puts "#{@name} was super hangry! They ATE YOU! >:("
			pretty_put(File.read('hangry.txt'))
			exit
		end
	end

	def pretty_put(text)
		case @fullness_level
			when 10
			puts text.colorize(:blue)
			when 6, 7, 8, 9
			puts text.colorize(:green)
			when 5
			puts text.colorize(:yellow)
			when 1, 2, 3, 4
			puts text.colorize(:light_red)
			when 0
			puts text.colorize(:red)
		end
	end
end

puff = BabyDragon.new("Puff the Magic Dragon")


puff.eat
puff.play
puff.take_a_nap


until puff.fullness_level == 0
	puff.play
	puff.take_a_nap
end