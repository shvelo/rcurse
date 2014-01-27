module Rcurse
    @helpers = Hash.new

    def self.add_helper helper
        @helpers[helper.name] = helper
    end

    def self.helpers
        @helpers
    end

    def self.render content
        content.gsub /{{([^ ]+) *(.+)?}}/ do |s|
            name = $1
            args = $2 ? $2.split(" ") : []
            if @helpers[name].is_a? Rcurse::Helper then
                @helpers[name].callback.call(args)
            end
        end
    end

    def self.render_file filename, out_filename
        content = File.read(filename)
        rendered_content = self.render(content)
        File.open(out_filename, "w+") do |file|
            file.write(rendered_content)
        end
    end
end
