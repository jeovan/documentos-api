Apipie.configure do |config|
  config.app_name                = "DocumentosApi"
  # config.api_base_url            = ""
  config.doc_base_url            = "/doc"
  config.translate               = false
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
end
