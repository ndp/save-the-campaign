require 'rspec/rails'
require 'rails/all'


module TestApp
  class Application < Rails::Application
    routes.draw do
      match ':controller(/:action(/:id))(.:format)'
    end
  end
end


class StubController < ActionController::Base
  include Rails.application.routes.url_helpers

  def foo
    redirect_to controller: :stub, action: :bar
  end

  def bar
    render nothing: true
  end
end

