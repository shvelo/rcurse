module Rcurse
    @helpers = Hash.new

    def self.add_helper helper
        @helpers[helper.name] = helper
    end

    def self.helpers
        @helpers
    end

    def self.render filename
        file_contents = File.read filename
        file_contents.gsub /{{([^ ]+) *(.+)?}}/ do |s|
            name = $1
            args = $2.split(" ") if $2
            if @helpers[name] then
                @helpers[name].callback.call(args)
            end
        end
    end
end