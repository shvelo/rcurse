module Rcurse
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