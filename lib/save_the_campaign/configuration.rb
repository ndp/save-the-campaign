class SaveTheCampaign::Configuration

  # Variables found
  # https://support.google.com/analytics/answer/1033867
  def initialize
    @params = %w{campaign medium source term name content keyword}.map {|k| "utm_#{k}"} << 'gclid'
    @auto_install = true
  end

  attr_accessor :params
  attr_accessor :auto_install
end