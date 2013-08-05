require 'rspec/core/rake_task'

include Rake::DSL

$: << File.join(File.expand_path(File.dirname(__FILE__)),'lib')

RSpec::Core::RakeTask.new(:spec)
task :default => :spec