project_root = File.dirname(File.absolute_path(__FILE__))

require "rcurse/engine"
require "rcurse/helper"

Dir.glob(project_root + '/rcurse/helpers/*.rb', &method(:require))