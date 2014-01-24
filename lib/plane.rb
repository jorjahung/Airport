class Plane

	def initialize
		takeoff
	end

	def flight_status
		return "In flight" if flying? 	
		return "On ground" if !flying?
	end

	def flying?
		@flying
	end

	def takeoff
		@flying = true
	end

	def landing
		@flying = false
	end


end