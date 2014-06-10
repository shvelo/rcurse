module Rcurse
    @helpers = Hash.new

    # Add a helper to Rcurse, called automatically when creating a helper
    def self.add_helper helper
        @helpers[helper.name] = helper
    end

    # Available helpers
    #
    # @return [Hash<Rcurse::Helper>] Available helpers, with helper names as keys
    def self.helpers
        @helpers
    end
    
    # Rcurse helper
    class Helper
        # Helper name
        attr_accessor :name

        # Helper callback
        attr_accessor :callback

        # Create a helper
        # 
        # @param name [String] helper name
        # @param callback [Block] callback, the helper body
        def initialize name, &callback
            @name = name
            @callback = callback

            # register the helper with Rcurse to use in templates
            Rcurse.add_helper self
        end
    end
end