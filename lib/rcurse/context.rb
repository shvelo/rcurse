module Rcurse
	# Template context
	class Context
		# Create a new context
		# 
		# @param path [String] Template directory path
		def initialize path = nil
			@binding = binding
			@path = path
		end

		# Get Binding object for the context
		# @return [Binding] binding object
		def get_binding
			@binding
		end

		# Evaluate Ruby code inside the context
		#
		# @param code [String] valid Ruby code
		# @return result of the evaluation
		def eval code
			@binding.eval code
		end

		# Template directory path
		attr_accessor :path
	end
end