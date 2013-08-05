require 'rubygems/package_task'
require 'rspec/core/rake_task'

include Rake::DSL
GEM_ROOT = File.expand_path(File.dirname(__FILE__))
$: << File.join(GEM_ROOT,'lib')

ENV["RAILS_ENV"] ||= 'test'

RSpec::Core::RakeTask.new(:spec)
task :default => :spec