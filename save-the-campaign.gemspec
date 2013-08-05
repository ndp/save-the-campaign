$:.push File.expand_path("../lib", __FILE__)
require 'save_the_campaign'
require 'save_the_campaign/version'


Gem::Specification.new do |s|
  s.name = 'save-the-campaign'
  s.version = SaveTheCampaign::Version::VERSION
  s.date = '2013-08-03'
  s.summary = "Preserves marketing campaign URL parameters through redirects"
  s.description = "Patches #redirect to include utm* parameters"
  s.authors = ["Andrew Peterson", 'Stitchfix Engineering']
  s.email = ['andy@stitchfix.com', 'andy@ndpsoftware.com', 'eng@stitchfix.com']
  s.files         = `git ls-files`.split($/)
  s.test_files    = s.files.grep(%r{^(spec)/})
  s.require_paths = ["lib"]
  s.homepage = 'http://github.com/stitchfix/save-the-campaign'
  s.license = 'MIT'
  s.add_dependency 'rails'
  s.add_development_dependency 'rspec-rails'
end
