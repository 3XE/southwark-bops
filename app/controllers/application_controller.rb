class ApplicationController < ActionController::Base
  if ENV["BASIC_AUTH_USER"].present? || ENV["BASIC_AUTH_PASS"].present?
    http_basic_authenticate_with name: ENV["BASIC_AUTH_USER"], password: ENV["BASIC_AUTH_PASS"]
  end
end
