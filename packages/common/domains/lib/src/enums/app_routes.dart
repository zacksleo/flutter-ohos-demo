enum AppRoutes {
  /// 首页
  home('/'),

  /// 插件
  plugins('/plugins/index'),

  /// 帮助中心
  support('/support/index');

  const AppRoutes(this.value);

  final String value;
}
