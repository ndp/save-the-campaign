require 'spec_helper'

describe StubController, type: 'controller' do

  context 'no configuration' do
    it 'redirects normally' do
      get 'foo'
      response.should redirect_to controller: 'stub', action: 'bar'
    end
  end

  context 'installed' do
    before { SaveTheCampaign.install }

    it 'preserves utm parameters' do
      campaign_params = {utm_source: 'the source', utm_campaign: 'the campaign', utm_medium: 'the medium'}

      get :foo, campaign_params

      response.should redirect_to campaign_params.merge(controller: 'stub', action: 'bar')
    end

    context 'with param overrides' do
      before do
        SaveTheCampaign.configure do |config|
          config.params << 'email'
          config.params << :name
        end
      end
      it 'preserves parameter specified with a string' do
        campaign_params = {utm_source: 'the source', email: 'a@example.com'}
        get :foo, campaign_params
        response.should redirect_to campaign_params.merge(controller: 'stub', action: 'bar')
      end
      it 'preserves parameters specified with symbols' do
        campaign_params = {utm_source: 'the source', name: 'Joe Bob'}
        get :foo, campaign_params
        response.should redirect_to campaign_params.merge(controller: 'stub', action: 'bar')
      end
    end
  end

end

