module Rcurse
    class Engine
        def self.render content, context = Context.new
            content.gsub /{({|%=|%)(.+?)[}|%]}/ do |s|
                result = s

                case $1
                when "{"
                    s = $2.split
                    name = s[0]
                    args = s[1..s.length]
                    if @helpers[name].is_a? Rcurse::Helper then
                        result = @helpers[name].callback.call(args, context)
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

        def self.render_file filename, out_filename, context = Context.new
            content = File.read(filename)
            rendered_content = self.render(content, context)
            File.open(out_filename, "w+") do |file|
                file.write(rendered_content)
            end
        end
    end

    def self.render content, context = Context.new
        Rcurse::Engine.render content, context
    end

    def self.render_file filename, out_filename, context = Context.new
        Rcurse::Engine.render_file filename, out_filename, context
    end
end
