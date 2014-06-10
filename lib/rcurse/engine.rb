module Rcurse

    # The Rcurse engine
    class Engine

        # Render a template
        #
        # @param content [String] A String containing the Rcurse template
        # @param context [Rcurse::Context] a context for the template
        # @return [String] The rendered template
        def self.render content, context = Context.new

            # find Rcurse calls in template
            # Regex explaination - http://goo.gl/vpKPeZ
            content.gsub /({{|{%=|{%)(.+?)[}|%]}/ do |match|
                # return unaltered if nothing is done
                result = match

                type = $1
                content = $2

                # determine what to do
                # helper calls start with {{
                # silent eval calls start with {%
                # eval calls start with {%=
                case type
                when "{{"
                    content_parts = content.chomp.split(" ")
                    name = content_parts[0]

                    # omit the first element
                    args = content_parts[1..-1]

                    # check if helper exists
                    if Rcurse::helpers[name].is_a? Rcurse::Helper then
                        result = Rcurse::helpers[name].callback.call(args, context)
                    end
                when "{%"
                    # evaluate code inside {% %}
                    context.eval(content)

                    # remove code from template
                    result = ""
                when "{%="
                    # evaluate code and write result to template
                    result = context.eval(content)
                end

                # return the result. replacing the Rcurse call
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

            # write rendered content to output file if specified
            File.open(out_filename, "w+") { |file| file.write(rendered_content) } if out_filename

            return rendered_content
        end
    end

    # (see Rcurse::Engine.render)
    def self.render content, context = Context.new
        # proxy
        Rcurse::Engine.render content, context
    end

    # (see Rcurse::Engine.render_file)
    def self.render_file filename, out_filename, context = Context.new
        # proxy
        Rcurse::Engine.render_file filename, out_filename, context
    end
end
