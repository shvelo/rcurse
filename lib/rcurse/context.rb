module Rcurse
	class Context
		def initialize path = nil
			@binding = binding
			@path = path
		end

		def get_binding
			@binding
		end

		def eval code
			@binding.eval code
		end

		attr_accessor :path
	end
end