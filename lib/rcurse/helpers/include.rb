Rcurse.add_helper(Rcurse::Helper.new("include") do |args, context|
    Rcurse::render(File.read(args[0]), context)
end)