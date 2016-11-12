class User
	attr_reader :username, :password
    
    def initialize (user, pass)
    	@username=user
    	@password=pass    	
    end
end

class User_List

	attr_reader :lista

	def initialize
		@lista ={}
	end

	def saveUser (user)
		@lista[user.username] = user.password
	end

	def contains_User? (user)
		return (@lista[user.username]==user.password)
	end
end

