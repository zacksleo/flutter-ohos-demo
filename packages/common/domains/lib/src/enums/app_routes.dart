enum AppRoutes {
  /// 首页
  home('/'),

  /// 社区
  community('/community/index'),

  /// 插件
  plugins('/plugins/index'),


  /// 帮助中心
  support('/support/index'),

  /// 播放器
  videoPlayer('/players/video-player');

  const AppRoutes(this.value);

  final String value;
}
