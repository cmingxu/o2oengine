require "omniauth-oauth2"


Rails.application.config.middleware.use OmniAuth::Builder do
  wechat_config = OpenStruct.new(YAML.load(File.read(Rails.root.join("config/wechat.yml")))[Rails.env])
  provider :wechat, wechat_config.appid, wechat_config.secret
end
