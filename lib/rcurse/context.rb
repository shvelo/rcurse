module Rcurse
	class Context
		def initialize
			@binding = binding
		end
		def get_binding
			@binding
		end
	end
end