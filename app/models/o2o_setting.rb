# == Schema Information
#
# Table name: o2o_settings
#
#  id         :integer          not null, primary key
#  var        :string(255)
#  value      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class O2oSetting < ActiveRecord::Base
  class << self
    def method_missing(var, *args)
      if var.intern =~ /=$/
        config = find_or_create_by(:var => var[0..-2])
        config.value  = args[0]
        config.save
      else
        where(:var => var).first.try(:value)
      end
    end
  end
end
