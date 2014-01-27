module Rcurse
    def render filename
        file_contents = File.read file
        rendered_file = fileContents.gsub /{{ *include (.+)*}}/ do |s|
            render(File.join "src", $1)
        end
        rendered_file
    end

    class Helper

    end
end