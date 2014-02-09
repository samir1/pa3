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
		row = 0
		(0..@maze.length).each do |i|
			if i % @n == 0 && i != 0
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

	def get_adjacent_openings index
		adj = []
		if @maze[index - @n] == '0'
			adj.push index - @n
		end
		if @maze[index + @n] == '0'
			adj.push index + @n
		end
		if @maze[index - 1] == '0'
			adj.push index - 1
		end
		if @maze[index + 1] == '0'
			adj.push index + 1
		end
		adj
	end

	def solve begX, begY, endX, endY
		begI = begY*@n + begX
		endI = endY*@n + endX
		v = []
		q = []
		q.push begI
		while !q.empty?
			currentI = q.pop
			return true if currentI == endI
			get_adjacent_openings(currentI).each do |x|
				if !v.include? x
					q.push x
					v.push x
				end
			end
		end
		return false
	end

	def trace begX, begY, endX, endY
		begI = begY*@n + begX
		endI = endY*@n + endX
		v = []
		q = []
		solutionVisited = []
		q.push begI
		while !q.empty?
			currentI = q.pop
			solutionVisited.push currentI
			return solutionVisited if currentI == endI
			get_adjacent_openings(currentI).each do |x|
				if !v.include? x
					q.push x
					v.push x
				end
			end
		end
		return false
	end

	def redesign
		string=""
		(0...@n).each {string+= "1"}
		(0...(@n-2)).each {|x| string += "1" + (x % 2 == 0 ? genEvenRan : genOddRan) + "1"}
		(0...@n).each {string+= "1"}
		m = Maze.new @m, @n
		m.load string
		m.display
	end

	def genEvenRan 
		string=""
		(0...(@m-2)).each {|x| string += (x % 2 == 0 ? "0" : rand(2).to_s)}
		string
	end

	def genOddRan
		string=""
		(0...(@m-2)).each {|x| string += rand(2).to_s}
		string
	end


end

maz = Maze.new 9,9
maz.load "111111111100010001111010101100010101101110101100000101111011101100000101111111111"
maz.display
puts
puts maz.solve 1, 1, 7, 7
puts
puts "indexes visited: " + (maz.trace 1, 1, 7, 7).to_s
puts
puts "Redesigned maze"
maz.redesign