Rcurse.add_helper(Rcurse::Helper.new("include") do |args|
    Rcurse::render args[0]
end)