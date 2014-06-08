module Rcurse
    @helpers = Hash.new

    def self.add_helper helper
        @helpers[helper.name] = helper
    end

    def self.helpers
        @helpers
    end

    def self.render content, context = Context.new
        content.gsub /{{([^ ]+) *(.+)?}}/ do |s|
            name = $1
            args = $2 ? $2.split(" ") : []
            if @helpers[name].is_a? Rcurse::Helper then
                @helpers[name].callback.call(args, context)
            end
        end
    end

    def self.render_file filename, out_filename, context = Context.new
        content = File.read(filename)
        rendered_content = self.render(content, context)
        File.open(out_filename, "w+") do |file|
            file.write(rendered_content)
        end
    end
end
