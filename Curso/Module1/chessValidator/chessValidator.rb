class ChessBoard
	attr_accessor :ChessBoard

	# Build and empty Board
	def initialize
		lineArray = [nil,nil,nil,nil,nil,nil,nil,nil]
		columnArray = lineArray.clone

		@chessBoard = columnArray
		ind = 0
		@chessBoard.each do |line|
			@chessBoard[ind] = lineArray.clone
			ind += 1
		end
	end

	# Place the initial lines on the board
	def startBoard
		line1Black=[:bR,:bN,:bB,:bQ,:bK,:bB,:bN,:bR]
		line1White=[:wR,:wN,:wB,:wQ,:wK,:wB,:wN,:wR]
		line2Black=[:bP,:bP,:bP,:bP,:bP,:bP,:bP,:bP]
		line2White=[:wP,:wP,:wP,:wP,:wP,:wP,:wP,:wP]
		@chessBoard[0]=line1Black
		@chessBoard[1]=line2Black
		@chessBoard[6]=line2White
		@chessBoard[7]=line1White		
	end

	# Return the piece that is in the position of the board
	# could be a Symbol o a Object (or nil)
	def pieceOnBoard(x,y)
		return (@chessBoard[y])[x]
	end
end

# static class to convert a chessPosition in the coordenates axis
class ConversionCoord
	@@conversionLine=['a','b','c','d','e','f','g','h']
	@@conversionColumn=['8','7','6','5','4','3','2','1']

	def self.convert(chessPosition)
		return @@conversionLine.index(chessPosition[0]), @@conversionColumn.index(chessPosition[1])
	end
end

class ChessPiece
	attr_accessor :name, :myX, :myY, :colour

	def initialize (name,x,y, colour)
		@name = name
		@myX = x
		@myY = y
		@colour = colour
	end

	def to_s
		return "ChessPiece: #{@name} => x:#{myX} y:#{myY} "
	end

end

class Rook < ChessPiece

	def checkMovementObject(orix, oriy, desx, desy)
		sameAxisX = orix==desx
		sameAxisY = oriy==desy
		return (sameAxisX ^ sameAxisY)
	end
end

class Bishop < ChessPiece

	def checkMovementObject(orix, oriy, desx, desy)

		# move in the same Axis
		notSameAxisX = orix!=desx
		notSameAxisY = oriy!=desy

		sameDistanceAxisX = ((orix-destx).abs==(oriy-desty).abs)

		return (notSameAxisX && notSameAxisY and sameDistanceAxisX )
	end
end

class Queen < ChessPiece

	def checkMovementObject(orix, oriy, desx, desy)

		# move in the same Axis
		sameAxisX = orix==desx
		sameAxisY = oriy==desy
		canImove = (sameAxisX ^ sameAxisY)

		# move in diagonal
		notSameAxisX = orix!=desx
		notSameAxisY = oriy!=desy
		sameDistanceAxisX = ((orix-destx).abs==(oriy-desty).abs)

		canImove = canImove ^ (notSameAxisX && notSameAxisY and sameDistanceAxisX )

		return canImove
	end
end

class Pawn < ChessPiece

	def checkMovementObject(orix, oriy, desx, desy)
		canImove = (orix==desx)
		desplaza = 1
		# if is the first movement we can move 2 positions
		if (  ( (@colour == "w")&&(oriy==6) ) ||( (@colour == "b")&&(oriy==1) )   )
			desplaza = 2
		end
		canImove = (canImove && ((oriy-desy).abs <desplaza+1))

		return canImove
	end
end

class King < ChessPiece
	def checkMovementObject(orix, oriy, desx, desy)
		canImove = (( (orix-desx).abs <2) && ((oriy-desy).abs <2))
		return canImove
	end
end

class Knight < ChessPiece
	def checkMovementObject(orix, oriy, desx, desy)

		canImove = ( ( (orix-desx).abs == 2 ) && ( (oriy-desy).abs == 1) )
		canImove = canImove || ( ( (orix-desx).abs == 1 ) && ( (oriy-desy).abs == 2) )
		return canImove
	end
end

class ChessValidator

	attr_reader :cheesBoard, :fakemode
	@@limits = [0,1,2,3,4,5,6,7]

	def initialize (board)
		@chessBoard = board
	end

	def setFakeMode(fakemode)
		@fakemode = fakemode
	end

	# Build the Object Instance of the piece
	def buildPieceObject(piezaOrigen, orix, oriy)
		colurPiece=piezaOrigen[0]
		kindPice=piezaOrigen[1]
		pieceObject = nil
		if (kindPice == "R")
			# the piece is a Rook
			pieceObject = Rook.new(piezaOrigen.to_s, orix, oriy, colurPiece)
		elsif (kindPice == "P")
			# the piece is a Pawn
			pieceObject = Pawn.new(piezaOrigen.to_s, orix, oriy, colurPiece)
		elsif (kindPice == "B")
			# the piece is a Pawn
			pieceObject = Bishop.new(piezaOrigen.to_s, orix, oriy, colurPiece)
		elsif (kindPice == "Q")
			# the piece is a Pawn
			pieceObject = Queen.new(piezaOrigen.to_s, orix, oriy, colurPiece)
		elsif (kindPice == "K")
			# the piece is a Pawn
			pieceObject = King.new(piezaOrigen.to_s, orix, oriy, colurPiece)
		elsif (kindPice == "N")
			# the piece is a Pawn
			pieceObject = Knight.new(piezaOrigen.to_s, orix, oriy, colurPiece)
		end
		return pieceObject
	end

	def checkMovement(piezaOrigen, piezaDestino, orix, oriy, desx, desy)

		statusMovement = "LEGAL"
		reasonStatusMovement = "..."

		if (piezaOrigen==nil)
			# Ther is NO pieces in this origin
			statusMovement = "ILLEGAL"
			reasonStatusMovement = "THERE IS NO PIECE TO MOVE"
		else 
			#check the movement dest is inside the board
			if  (@@limits.include? orix) && (@@limits.include? oriy) && (@@limits.include? desx) && (@@limits.include? desy) 

				# Build the piece object instance
				cheessPieceOriginObject = buildPieceObject(piezaOrigen, orix, oriy)

				puts "--> My PIECE #{cheessPieceOriginObject.to_s}"
				# first of all check if there is another piece on the destination
				if (piezaDestino!=nil)
					# there is a piece on the destination					
					if (@fakemode)
						# first iteration with FAKE mode: you can move in our own color space but not in the opposite color space
						if( piezaOrigen[0]!=piezaDestino[0] )
							# there is a opposite colour piece in the place
							statusMovement = "ILLEGAL"
							reasonStatusMovement = "fakeMode: There is a diferent colour piece on destination"
						else
							# there is a same colour piece in the place 
							if (cheessPieceOriginObject.checkMovementObject(orix,oriy,desx,desy))
								statusMovement = "ILLEGAL"
								reasonStatusMovement = "fakeMode: There is a same colour piece on destination. You can not MOVE THERE"
							end
						end

					else
						# Normal Movement YOU CAN EAT
						if( piezaOrigen[0]!=piezaDestino[0] )
							# there is a opposite colour piece in the place
							if (cheessPieceOriginObject.checkMovementObject(orix,oriy,desx,desy))
								statusMovement = "LEGAL"
								reasonStatusMovement = "There is a diferent colour piece on destination. YOU EAT IT"
							end
						else
							# there is a same colour piece in the place
							statusMovement = "ILLEGAL"
							reasonStatusMovement = "There is a same colour piece on destination. You can not MOVE THERE"
						end
					end

				else
					# there is NO pieces on the destination	
					if (cheessPieceOriginObject.checkMovementObject(orix,oriy,desx,desy))
						statusMovement = "LEGAL"
						reasonStatusMovement = "NO pieces in the destination & the movement is OK"
					else
						statusMovement = "ILLEGAL"
						reasonStatusMovement = "NO pieces there BUT unfortunatly the movement is NOT correct"
					end

				end
			else
				statusMovement = "ILLEGAL"
				reasonStatusMovement = "OUT OF THE BOARD"
			end
		end

		return statusMovement,reasonStatusMovement

	end

	def startValidation
		movements = IO.readlines("movements.txt");

		File.delete("validation.txt");
		salida = File.open("validation.txt", 'a');

		movements.each do |movement|


			origen_dest = movement.split(" ")
			origen = origen_dest[0]
			destino = origen_dest[1]
			statusMovement = ""
			reasonStatusMovement = ""

			puts ("Movimiento #{origen_dest}")
			orix, oriy = ConversionCoord.convert(origen)
			puts ("Coordenadas Origen #{orix},#{oriy}")			
			desx, desy = ConversionCoord.convert(destino)

			puts ("Coordenadas Destino #{desx},#{desy}")
			piezaOrigen = @chessBoard.pieceOnBoard(orix, oriy)

			if (piezaOrigen !=nil)
				piezaDestino = @chessBoard.pieceOnBoard(desx, desy)
				puts("Pieza Origen: #{piezaOrigen}")

				statusMovement,reasonStatusMovement = checkMovement(piezaOrigen, piezaDestino, orix, oriy, desx, desy)		
			else
				statusMovement = "ILLEGAL"
				reasonStatusMovement = "There is NO pieces in the origin position to MOVE"
			end

			salida.puts("MOVEMENT [#{piezaOrigen}]: #{origen_dest} ---> #{statusMovement} ,reason: #{reasonStatusMovement}")
			puts("MOVEMENT [#{piezaOrigen}]: #{origen_dest} ---> #{statusMovement} ,reason: #{reasonStatusMovement}")
		end

		salida.close
	end


end


chessBoard = ChessBoard.new
chessBoard.startBoard

simulation = ChessValidator.new(chessBoard)
simulation.setFakeMode(true)
simulation.startValidation