require 'action_controller'

class SaveTheCampaign

  def self.install
    return if @installed
    ::ActionController::Base.send(:include, SaveTheCampaign::ControllerMixin)
    @installed = true
  end

  def self.configure
    yield configuration
    self
  end

  def self.configuration
    require 'save_the_campaign/configuration'
    @configuration ||= SaveTheCampaign::Configuration.new
  end
end

require 'save_the_campaign/controller_mixin'

if SaveTheCampaign.configuration.auto_install
  SaveTheCampaign.install
end
