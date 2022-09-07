# frozen_string_literal: true

class WelcomeController < ApplicationController
  skip_before_action :api_key_verification

  def index
    render html: 'Please Visit <a href="https://roed-to-aid.herokuapp.com/">Roe\'d To Aid</a>'.html_safe
  end
end
