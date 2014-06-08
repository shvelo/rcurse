module Rcurse
    @helpers = Hash.new

    def self.add_helper helper
        @helpers[helper.name] = helper
    end

    def self.helpers
        @helpers
    end
    
    class Helper
        attr_accessor :name
        attr_accessor :callback

        def initialize name, &callback
            @name = name
            @callback = callback

            Rcurse.add_helper self
        end
    end
end