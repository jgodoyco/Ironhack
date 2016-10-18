class Room
	attr_accessor :outs
	attr_accessor :id
	attr_accessor :positionX
	attr_accessor :positionY
	# Each Room has a Identification x,y
	# Each Room has 2 or more outs
	# Each Room has 4 doors  N,S,W,E
	# Outs is an array that has two rooms of next rooms and two -1 to identify a fake door
	#    example Room 3 has outs [-1,Room,-1,Room] this means that this Room has outs in the S & E doors
	
	def initialize(id, outs, x,y)
		@id = id
		@outs = outs
		@positionX=x
		@positionY=y
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
		return "     N    \n ----|----\n |       |\nW-  #{@positionX},#{positionY} -E\n |       |\n ----|----\n     S    \nOUTS: #{@outs.to_s}\n"
	end

	private 
	# Convert a Direction in a convenction index
	def giveMeIndex(direction)
		index = -1
		if (direction=='N')
			index = 0
		elsif (direction=='S')
			index = 1
		elsif (direction=='W')
			index = 2
		elsif (direction=='E')
			index = 3
		end
		return index
	end
end

class Maze
	attr_accessor :maze

	def initialize(size)
		@maze = {}
		createMaze(size)
	end

	def putRoomOnMaze(room)
		key = getKey(room.positionX,room.positionY)
		@maze.store(key,room)
		#puts "ALTA de HABITACION "+key+" --> ["+room.id.to_s+"] "+room.outs.to_s
	end

	def getDefOuts(x,y)
		origin = [-1,-1,-1,-1]
		key = getKey(x,y)
		if (@maze.has_key?(key))
			room = @maze[key]
			origin = room.outs
			puts "    --> REVISITANDO HABITACION  "+ room.id.to_s
		end		
		return origin
	end

	def isNewRoom?(outs)
		return (outs == [-1,-1,-1,-1])
	end

	def getRoom(key)
		return @maze[key]
	end

	def getKey(x,y)
		return "#{x.to_s},#{y.to_s}"
	end

	# Choose a Random door for the Room
	def chooseNextDoor
		return Random.new.rand(0..3)
	end

	def chooseOpositeDoor(door)
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

	def to_s
		 strMaze = ""
		 @maze.each do |clv, room|
		 	strMaze += room.to_s
		 end
		 return strMaze
	end

	def changeX(movement,x)
		if (movement==2)
			x= x-1
		elsif (movement==3)
			x= x+1
		end
		return x
	end

	def changeY(movement,y)
		if (movement==0)
			y= y+1
		elsif (movement==1)
			y= y-1
		end
		return y
	end

	# Choose parameters form teh new Room
	def chooseRoom(outs, thisX, thisY, nextX, nextY, movement, opositeDoor)
		return outs, thisX, thisY, nextX, nextY, movement, opositeDoor
	end


	def createMaze(size)
		thisX=0
		thisY=0
		nextX=0
		nextY=0
		previusRoom=[]
		previusDoor=[]
		opositeDoor = -1

		# Building a Maze with size-Rooms
		for idRoom in 0..size-1

			thisX =nextX
			thisY =nextY
			previusRoom[idRoom]=getKey(thisX,thisY)
					
#------
			outs = getDefOuts(thisX,thisY)
			if (opositeDoor!=-1)  
				outs[opositeDoor] = previusRoom[idRoom-1]
			end

			isNewRoom = isNewRoom?(outs)

			# choose the door to go to the next 
			movement = chooseNextDoor
			if (!isNewRoom)
				# if i revisit a old room 
				# choose an un-used door
				while (outs[movement]!=-1)
					movement = chooseNextDoor
				end
			end
			nextX = changeX(movement, thisX)
			nextY = changeY(movement, thisY)
			opositeDoor = chooseOpositeDoor(movement)
			
#-------			
				
			#i'm building the id=i Room
			if (idRoom==0)
				# Start of the Maze				
				# add new out-door to outs array
				outs[movement] = getKey(nextX,nextY)

			elsif (idRoom>0 )

				# In the middle of the Maze				
				nextRoom = getKey(nextX,nextY)
				# Repeat the eleccion of nextRoom to avoid the comeBack to the previous Room
				while (previusRoom[idRoom-1] == nextRoom)
					outs[opositeDoor] = -1
					outs = getDefOuts(thisX,thisY)
					movement = chooseNextDoor
					nextX = changeX(movement, thisX)
					nextY = changeY(movement, thisY)
					opositeDoor = chooseOpositeDoor(movement)					
					nextRoom = getKey(nextX,nextY)				
				end	
				if (idRoom==size-1)	
					outs[movement] = "END"
				else
					outs[movement] = nextRoom
				end

			end
			# put the id of the next room in the correct direction	
			putRoomOnMaze(Room.new(idRoom, outs, thisX, thisY))

		end
	end
end






class Player 
	attr_accessor :lives
	attr_accessor :playerRoom

	def initialize (lives)
		@lives = lives
		@playerRoom = "0,0"
	end

end

class MazeGame
	attr_reader :myMaze
	attr_reader :player	

	def initialize(size, player)
		@myMaze = Maze.new(size)
		@player = player
		@fin =false
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
		while ((@player.lives > 0)&&(!@fin))
			puts " "
			puts " You have #{@player.lives} LIVES"
			playRoom = @myMaze.getRoom(@player.playerRoom)
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
				idRoom = playRoom.roomInDirection(direction)
				if (idRoom != "END")
					@player.playerRoom = idRoom
				else
					fin = true
					puts " Congratulations !! YOU FIND THE OUT FOR THE MAZE !!!"
					puts " ...................................................."
				end
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
#puts MazeGame.new(10,Player.new(3)).myMaze.to_s
