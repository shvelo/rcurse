module Rcurse

    # The Rcurse engine
    class Engine

        # Render a template
        #
        # @param content [String] A String containing the Rcurse template
        # @param context [Rcurse::Context] a context for the template
        # @return [String] The rendered template
        def self.render content, context = Context.new
            content.gsub /{({|%=|%)(.+?)[}|%]}/ do |s|
                result = s

                case $1
                when "{"
                    s = $2.chomp.split(" ")
                    name = s[0]
                    args = s[1..s.length]
                    if Rcurse::helpers[name].is_a? Rcurse::Helper then
                        result = Rcurse::helpers[name].callback.call(args, context)
                    end
                when "%"
                    context.eval($2)
                    result = ""
                when "%="
                    result = context.eval($2)
                end

                result
            end
        end

        # Render a template file, optionally writing output to another file
        #
        # @param filename [String] A String containing the Rcurse template
        # @param out_filename [String] Optional, file to write output to
        # @param context [Rcurse::Context] a context for the template
        # @return [String] The rendered template
        def self.render_file filename, out_filename = nil, context = Context.new
            content = File.read(filename)
            context.path = File.dirname(filename)
            rendered_content = self.render(content, context)
            File.open(out_filename, "w+") { |file| file.write(rendered_content) } if out_filename

            rendered_content
        end
    end

    # (see Rcurse::Engine.render)
    def self.render content, context = Context.new
        Rcurse::Engine.render content, context
    end

    # (see Rcurse::Engine.render_file)
    def self.render_file filename, out_filename, context = Context.new
        Rcurse::Engine.render_file filename, out_filename, context
    end
end
