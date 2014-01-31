# Author: Samir Undavia

class Maze

	def initialize n,m
		@n = n
		@m = m
	end

	def load arg
		@maze = arg
	end

	def display
		width = @n
		length = @m
		row = 0
		for i in 0..@maze.length
			if i % width == 0 && i != 0
				puts
				row += 1
			end
			if row.odd? && @maze[i] == '1'
				print '|'
			elsif row.even? && @maze[i] == '1'
				if i.even?
					print '+'
				else
					print '-'
				end
			elsif @maze[i] == '0'
				print ' '
			end
		end
	end

	def solve begX, begY, endX, endY

	end

	def trace begX, begY, endX, endY

	end

	def redesign

	end

end

maz = Maze.new 9,9
maz.load "111111111100010001111010101100010101101110101100000101111011101100000101111111111"
maz.display