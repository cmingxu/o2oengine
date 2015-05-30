function map_prepare() {
  var mapObj = new AMap.Map("map_container", {view: new AMap.View2D({//创建地图二维视口
    zoom:13, //设置地图缩放级别
    rotation:0 //设置地图旋转角度
  })
  });
  var marker = new AMap.Marker({ //创建自定义点标注
    map:mapObj,
    position: new AMap.LngLat(116.406326, 39.903942),
    offset: new AMap.Pixel(-10,-34),
    icon: ""
  });

  mapObj.plugin(["AMap.ToolBar","AMap.OverView","AMap.Scale"],function(){
    //加载工具条
    tool = new AMap.ToolBar({
      direction:false,//隐藏方向导航
      ruler:false,//隐藏视野级别控制尺
      autoPosition:false//禁止自动定位
    });
    mapObj.addControl(tool);
    //加载鹰眼
    view = new AMap.OverView();
    mapObj.addControl(view);
    //加载比例尺
    scale = new AMap.Scale();
    mapObj.addControl(scale);
  });

  AMap.service('AMap.DistrictSearch', function () {
    var opts = {
      subdistrict: 1,   //返回下一级行政区
      level:'city'  //查询行政级别为 市
    };

    district = new AMap.DistrictSearch(opts); 
    district.setLevel('district');
    district.search(city, function(status, result){
      mapObj.setCenter(result.districtList[0].center);
    });
  });
}

$(document).ready(function () {
  map_prepare();
});
