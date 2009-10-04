
if defined? Rails
  require 'collecta'
  config_file = File.join(RAILS_ROOT, "config", "collecta.yml")
  if File.exist?(config_file)
    config = YAML.load_file(config_file)
    if !config[RAILS_ENV.to_s].nil? && !config[RAILS_ENV.to_s]["api_key"].nil?
      Collecta.api_key = config[RAILS_ENV.to_s]["api_key"]
    end
  end
end