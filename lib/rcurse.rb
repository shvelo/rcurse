# determine absolute path to Rcurse files
project_root = File.dirname(File.absolute_path(__FILE__))

require project_root + "/rcurse/engine.rb"
require project_root + "/rcurse/helper.rb"
require project_root + "/rcurse/context.rb"

# require all ruby files from rcurse/helpers.
Dir.glob(project_root + '/rcurse/helpers/*.rb', &method(:require))

# Rcurse - super simple template engine
module Rcurse
end