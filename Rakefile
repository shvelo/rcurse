project_root = File.dirname(File.absolute_path(__FILE__))
rcurse_path = project_root + "/lib/rcurse.rb"

task :spec do
	system "bundle exec rspec --color -f d -r #{rcurse_path}"
end

task :doc do
	system "bundle exec yard"
end

task :clean do
	Dir.glob(project_root + "/spec-data/*.out") do |f|
		File.delete f
	end
end

task :default => [:spec, :doc, :clean]