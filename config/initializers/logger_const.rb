unless defined?WECHAT_LOGGER
  WECHAT_LOGGER = Logger.new Rails.root.join("log", "wechat_log.log")
end
