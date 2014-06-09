Rcurse::Helper.new("include") do |args, context|
	if context.path then
			file_path = File.expand_path(args[0], context.path)
		else 
			file_path = args[0]
		end
  Rcurse::render(File.read(file_path), context)
end