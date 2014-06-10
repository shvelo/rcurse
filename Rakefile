project_root = File.dirname(File.absolute_path(__FILE__))
rcurse_path = project_root + "/lib/rcurse.rb"

desc "run tests"
task :spec do
	system "bundle exec rspec --color -f d -r #{rcurse_path}"
end

desc "generate docs"
task :doc do
	system "bundle exec yard --template-path=#{project_root}/doc-templates"
end

desc "preview docs"
task :docserver do
	system "bundle exec yard server --reload --template-path=#{project_root}/doc-templates"
end

desc "clean up test data"
task :clean do
	Dir.glob(project_root + "/spec-data/*.out") do |file|
		File.delete file
	end
end

desc "run tests, generate docs and clean up"
task :default => [:spec, :doc, :clean]