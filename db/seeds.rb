Category.create :name => "白酒"
Category.create :name => "啤酒"
Category.create :name => "洋酒"
Category.create :name => "黄酒"
Category.create :name => "养生酒"
Category.create :name => "收藏酒"
Category.create :name => "陈年老酒"

O2oSetting.province="内蒙古"
O2oSetting.city="赤峰市"

User.create

Lb::Product.create :name => "娃哈哈大桶矿泉水", :price => 20, :water_type => "矿泉水",
  :brand => "娃哈哈", :container_type => "大桶", :desc => "娃哈哈大桶矿泉水"

Lb::Product.create :name => "乐百氏大桶矿泉水", :price => 20, :water_type => "矿泉水",
  :brand => "乐百氏", :container_type => "大桶", :desc => "乐百氏大桶矿泉水"

Lb::Product.create :name => "景田大桶矿泉水", :price => 20, :water_type => "矿泉水",
  :brand => "景田", :container_type => "大桶", :desc => "景田大桶矿泉水"

Lb::Product.create :name => "怡宝大桶矿泉水", :price => 20, :water_type => "矿泉水",
  :brand => "怡宝", :container_type => "大桶", :desc => "怡宝大桶矿泉水"


%w(luoboyun@qq.com luobotou@qq.com).each do |a|
  Staff.create :name => a, :password => a, :login => a
end
