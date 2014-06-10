Rcurse::Helper.new("include") do |args, context|
	# set the file path relative to context.path or to working directory
	if context.path then
		file_path = File.expand_path(args[0], context.path)
	else 
		file_path = args[0]
	end

  Rcurse::render_file(file_path, nil, context)
end