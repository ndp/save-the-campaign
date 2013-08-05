module SaveTheCampaign::ControllerMixin

  def self.included base
    base.alias_method_chain :_compute_redirect_to_location, :preserving_utm_params
  end

  def _compute_redirect_to_location_with_preserving_utm_params(options = {})

    keys = SaveTheCampaign.configuration.params.map(&:to_s)

    params_to_forward = params.select { |k, _| keys.include? k }

    url = _compute_redirect_to_location_without_preserving_utm_params(options)

    return url if params_to_forward.empty?

    url << "?" unless url =~ /\?/
    url << params_to_forward.to_param
  end

end