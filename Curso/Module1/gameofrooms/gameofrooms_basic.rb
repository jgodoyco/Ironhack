class Room
	attr_reader :outs
	# Each Room has a Identification id
	# Each Room has 2 or more outs
	# Each Room has 4 doors  N,S,W,E
	# Outs is an array that has two id of next rooms and two -1 to identify a fake door
	#    example Room 3 has outs [-1,4,-1,2] this means that this Room has outs in the S & E doors
	def initialize(id, outs)
		@id = id
		@outs = outs
	end
	
	# This show if you have an out in this direction
	def canYouGoOut?(direction)
		return @outs[giveMeIndex(direction)] != -1			
	end
	# This show wich Room you have in this direction
	def roomInDirection(direction)		
		return @outs[giveMeIndex(direction)]
	end
	# Return a room prepared to print
	def to_s
		if (@id>9)
			return "   N  \n --|--\n |   |\nW- #{@id} -E\n |   |\n --|--\n   S  \nOUTS: #{@outs.to_s}\n"
		elsif
			return "   N  \n --|--\n |   |\nW- #{@id}-E\n |   |\n --|--\n   S  \nOUTS: #{@outs.to_s}\n"
		end
	end

	private 
	# Convert a Direction in a convenction index
	def giveMeIndex(direction)
		id = -1
		if (direction=='N')
			id = 0
		elsif (direction=='S')
			id = 1
		elsif (direction=='W')
			id = 2
		elsif (direction=='E')
			id = 3
		end
		return id
	end
end

class Maze
	# directions = ['N','S','W','E']
	def initialize(size)
		@size =size
		@theMaze =[]
		createMaze(@size)
	end

	# a Maze is a Hash of Rooms
	def createMaze(size)
		# Origin is the door wich comes from the next Room
		# Build Maze
		comeFrom = 0
		for i in 0..size-1
			origin = [-1,-1,-1,-1]
			#i'm building the id=i Room
			if (i==0)
				# Start of the Maze
				# choose the door to go to the next Room
				comeFrom = chooseDoor
				# put the id of the next room in the correct direction			
				origin[comeFrom]=i+1
				#create and add the Room
				@theMaze << Room.new(i,origin)
			elsif (i==size-1)
				# End of the Maze
				# In this Room the door wich you come is the opposite of the door where you come from
				origin[chooseOpositeDoor(comeFrom)]=i-1
				#create and add the Room
				@theMaze << Room.new(i,origin)
			elsif
				opositeDoor = chooseOpositeDoor(comeFrom)
				# In the middle of the Maze
				origin[opositeDoor]=i-1
				# choose the door to go to the next 
				comeFrom = chooseDoor
				while (comeFrom == opositeDoor)
					comeFrom = chooseDoor
				end
				# put the id of the next room in the correct direction			
				origin[comeFrom]=i+1
				@theMaze << Room.new(i,origin)
			end
		end
	end

	# Choose a Random door for the Room
	def chooseDoor
		return Random.new.rand(0..3)
	end

	# Choose a Random door for the Room
	def chooseOpositeDoor(door)
		opositeDoor = door
		if door == 0
			opositeDoor = 1
		elsif door == 1
			opositeDoor = 0
		elsif door == 2
			opositeDoor = 3
		elsif door == 3
			opositeDoor = 2
		end
		return opositeDoor
	end

	def getRoom(i)
		return @theMaze[i]
	end

	def to_s
		 strMaze = ""
		 @theMaze.each do |room|
		 	strMaze += room.to_s
		 	strMaze += "OUTS => "+room.outs.to_s+"\n"
		 end
		 return strMaze
	end
end

class Player 
	attr_accessor :lives
	attr_accessor :playerRoom

	def initialize (lives)
		@lives = lives
		@playerRoom = 0
	end

end

class MazeGame
	attr_reader :maze
	attr_reader :player

	

	def initialize(size, player)
		@maze = Maze.new(size)
		@player = player
	end

	def startGame
		@allowedDirections = ['N','S','W','E']
		puts
		puts " ********************************************"
		puts " ************** THE MAZE GAME ***************"
		puts " ********************************************"
		puts " "
		puts " Start !! "
		puts " "

		# Allways start in the zero 0 Romm
		while (@player.lives > 0)
			puts " "
			puts " You have #{@player.lives} LIVES"
			playRoom = @maze.getRoom(@player.playerRoom)
			puts " You are in the Room #{@playerRoom}"
			puts playRoom
			puts " Which direction do you want to go? ['N','S','W','E'] -->"
			print " > "
			direction  = gets.chomp.upcase
			puts " You select the #{direction} door !!"
			while ( (@allowedDirections.include? direction) == false) 
				puts ""
				puts " Which direction do you want to go? ['N','S','W','E'] -->"
				print " > "
				direction  = gets.chomp.upcase
				puts " You select the #{direction} door !!"
			end
			if (playRoom.canYouGoOut?(direction))
				puts " ¡¡ Perfect !! You find the rigth door ..."
				@player.playerRoom= playRoom.roomInDirection(direction)
			else
				puts " Sorry you choose the fake door !!"
				@player.lives=@player.lives-1
			end
		end	
		
		puts " "
		puts " ************** GAME OVER ***************"
	end
end


MazeGame.new(10,Player.new(3)).startGame