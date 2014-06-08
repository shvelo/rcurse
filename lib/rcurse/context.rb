module Rcurse
	class Context
		def initialize
			@binding = binding
		end
		def get_binding
			@binding
		end
		def eval code
			@binding.eval code
		end
	end
end