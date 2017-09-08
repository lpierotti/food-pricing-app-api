class ApplicationController < ActionController::API

  require 'csv'
  require 'json'

  CSV.parse(data).to_json
end
