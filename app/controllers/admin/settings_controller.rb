class Admin::SettingsController < Admin::BaseController
  def index
    @settings = O2oSetting.all
  end
end
