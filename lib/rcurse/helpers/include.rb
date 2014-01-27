Rcurse.add_helper(Rcurse::Helper.new("include") do |args|
    Rcurse::render File.read(args[0])
end)